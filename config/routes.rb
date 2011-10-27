# Check out https://github.com/joshbuddy/http_router for more
# information on HttpRouter.

HttpRouter.new do

  # API Routes
  get('/posts').to(Api::Blog::Index)

  get('/posts/tags').to(Api::Blog::TagIndex)
  get('/posts/tags/:id').to(Api::Blog::ShowTag)

  get('/posts/:id').to(Api::Blog::Show)

  # Splash
  add('/').to(Api::Root)

end
