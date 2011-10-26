module Api
  module Blog

    class Index < Base
      def start
        posts = Post.posts.keys.sort.inject([]) do |result, key|
          result << Post[key].select { |k, _|
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

  end
end
