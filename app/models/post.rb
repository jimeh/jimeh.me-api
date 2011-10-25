require 'date'
require 'yaml'
require 'redcarpet'

class Post

  class << self

    def initialize!(root_path)
      @root_path = root_path
      Dir["#{root_path}/*.md"].each do |file|
        post = {
          :id    => nil,
          :date  => nil,
          :title => nil,
          :html  => nil
        }

        id   = File.basename(file).gsub(/\.md$/, '')
        date = Date.parse(id.match(/([\d]{4}-[\d]{2}-[\d]{2})/)[1])
        slug = id.match(/[\d]{4}-[\d]{2}-[\d]{2}-(.+)/)[1]

        content = File.read(file)
        if matches = content.match(/^---\n(.*?)\n---\n(.*)/m)
          YAML.load(matches[1]).each do |key, value|
            post[key.to_sym] = value
          end
          content = matches[2].strip
        end

        post.merge!(
          :id => id,
          :date => date,
          :slug => slug,
          :markdown => content,
          :html => markdown.render(content)
        )

        posts[post[:id]] = post
      end
    end

    def [](id)
      posts[id]
    end

    def posts
      @posts ||= {}
    end

    private

    def markdown
      @markdown ||= ::Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :tables => true,
        :fenced_code_blocks => true,
        :space_after_headers => true)
    end

  end # << self

end
