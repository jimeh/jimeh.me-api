require 'date'
require 'yaml'
require 'digest/md5'

require 'redcarpet'

class Post < Hash

  class << self

    def initialize!(root_path)
      @root_path = root_path
      Dir["#{root_path}/*.md"].each do |file|
        post = self.new(file)
        posts[post[:id]] = post
      end
      sort_tag_index
    end

    def all
      @all ||= posts.values.sort {|a,b| a[:date] <=> b[:date]}
    end

    def [](id)
      posts[id]
    end

    def posts
      @posts ||= {}
    end

    def tags
      @tags ||= {}
    end

    def markdown
      @markdown ||= ::Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :tables => true,
        :fenced_code_blocks => true,
        :space_after_headers => true)
    end

    def syntax_highlighter(html)
      doc = Nokogiri::HTML(html)
      doc.search("//pre/code[@class]").each do |pre|
        pre.parent.replace Pygmentize.process(pre.text.rstrip, pre[:class])
      end
      doc.search('//body').children.to_s
    end

    def sort_tag_index
      tags.each do |key, posts|
        posts.sort! { |a,b| a[:date] <=> b[:date] }
      end
    end

  end # << self

  def initialize(file)
    set_required_keys

    @file = file

    load_and_parse
    render
    render_tags
  end

  attr_reader :file
  attr_reader :raw

  def filename
    @filename ||= File.basename(file)
  end

  def uid
    @slug ||= filename.match(/^(?:\d{4}-\d{2}-\d{2}-|)(.+)\.md$/)[1]
  end

  private

  def render
    self[:id]     = uid
    self[:body]   = self.class.syntax_highlighter(markdown.render(raw))
    self[:source] = raw
  end

  def load_and_parse
    @raw = File.read(file).strip
    parse
  end

  def render_tags
    if self[:tags]
      self[:tags].each do |cat|
        self.class.tags[cat.to_sym] ||= []
        self.class.tags[cat.to_sym] << self
      end
    end
  end

  def parse
    if matches = @raw.match(/^---\n(.*?)\n---\n(.*)$/m)
      YAML.load(matches[1]).each do |key, value|
        self[key.to_sym] = value
      end
      @raw = matches[2].strip
    end
  end

  def set_required_keys
    self.merge!(
      :id    => nil,
      :date  => nil,
      :title => nil,
      :body  => nil)
  end

  def markdown
    self.class.markdown
  end

end
