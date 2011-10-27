module Api
  module Blog

    class Index < Base
      def start
        posts = Post.all.inject([]) do |result, post|
          result << post.select { |k, _|
            [:id, :date, :title, :slug].include?(k)
          }
        end
        render_json(posts.reverse)
        finish
      end
    end # Index

    class Show < Base
      before_start :check_post_id

      def start
        post = Post[params[:id]]
        post = post.reject { |k,v| k == :source } unless params[:source]

        render_json(post)
        finish
      end

      private

      def check_post_id
        if !Post.posts.has_key?(params[:id])
          halt 404, {'Content-Type' => 'application/json; charset=utf-8'}, "{}"
        else
          yield
        end
      end
    end # Show


    class CategoryIndex < Base
      def start
        categories = Post.categories.inject({}) do |result, (key, posts)|
          result[key] = {:post_count => posts.size}
          result
        end
        render_json(Hash[categories.sort])
        finish
      end
    end # CategoryIndex

    class CategoryShow < Base
      before_start :check_category_id

      def start
        posts = Post.categories[params[:id].to_sym].inject([]) do |result, post|
          result << post.select { |k, _|
            [:id, :date, :title, :slug].include?(k)
          }
          result
        end
        render_json(posts.reverse)
        finish
      end

      def check_category_id
        if !Post.categories.has_key?(params[:id].to_sym)
          halt 404, {'Content-Type' => 'application/json; charset=utf-8'}, "{}"
        else
          yield
        end
      end
    end # CategoryShow

  end
end
