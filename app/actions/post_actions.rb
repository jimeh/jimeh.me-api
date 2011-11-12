require 'app/actions/base_action'

module PostActions

  class Index < BaseAction
    def start
      posts = Post.all.inject([]) do |result, post|
        result << post.select { |k, _|
          [:id, :date, :title].include?(k)
        }
      end
      render_as_json(posts.reverse)
      finish
    end
  end # Index

  class Show < BaseAction
    before_start :check_post_id

    def start
      post = Post[params[:id]]
      post = post.reject { |k,v| k == :source } unless params[:source]

      render_as_json(post)
      finish
    end

    private

    def check_post_id
      if !Post.posts.has_key?(params[:id])
        not_found!
      else
        yield
      end
    end
  end # Show


  class TagIndex < BaseAction
    def start
      tags = Post.tags.inject({}) do |result, (key, posts)|
        result[key] = {:post_count => posts.size}
        result
      end
      render_as_json(Hash[tags.sort])
      finish
    end
  end # TagIndex

  class ShowTag < BaseAction
    before_start :check_tag_id

    def start
      posts = Post.tags[params[:id].to_sym].inject([]) do |result, post|
        result << post.select { |k, _|
          [:id, :date, :title].include?(k)
        }
        result
      end
      render_as_json(posts.reverse)
      finish
    end

    def check_tag_id
      if !Post.tags.has_key?(params[:id].to_sym)
        not_found!
      else
        yield
      end
    end
  end # ShowTag

end # Posts
