module Api
  module Blog

    class Index < Base
      def start
        posts = Post.posts.inject([]) do |result, (key, value)|
          result << value.select { |k, _|
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
        post = post.reject { |k,v| k == :markdown } unless params[:markdown]

        render_json(post)
        finish
      end

      private

      def check_post_id
        if !Post.posts.has_key?(params[:id])
          halt 404, {'Content-Type' => 'application/json'}, "{}"
        else
          yield
        end
      end
    end # Show

  end
end
