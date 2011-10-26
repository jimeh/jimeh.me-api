require 'date'
require 'yaml'

require 'redcarpet'

class Post < Hash

  class << self

    def initialize!(root_path)
      @root_path = root_path
      Dir["#{root_path}/*.md"].each do |file|
        post = self.new(file)
        posts[post[:id]] = post
      end
    end

    def [](id)
      posts[id]
    end

    def posts
      @posts ||= {}
    end

    def markdown
      @markdown ||= ::Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :tables => true,
        :fenced_code_blocks => true,
        :space_after_headers => true)
    end

  end # << self

  def initialize(file)
    set_required_keys

    @file = file

    self[:id] = uid
    self[:date] = date
    self[:slug] = slug

    load_and_parse
    render
  end

  def uid
    @uid ||= filename.gsub(/\.md$/, '')
  end

  def filename
    @filename ||= File.basename(@file)
  end

  def date
    @date ||= Date.parse(filename.match(/^([\d]{4}-[\d]{2}-[\d]{2})/)[1])
  end

  def slug
    @slug ||= filename.match(/[\d]{4}-[\d]{2}-[\d]{2}-(.+)\.md$/)[1]
  end

  private

  def render
    self[:body]   = markdown.render(@raw)
    self[:source] = @raw
  end

  def load_and_parse
    @raw = File.read(@file).strip
    parse
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
