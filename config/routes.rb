# Check out https://github.com/joshbuddy/http_router for more
# information on HttpRouter.

HttpRouter.new do

  # API Routes
  get('/posts').to(Api::Blog::Index)

  get('/posts/categories').to(Api::Blog::CategoryIndex)
  get('/posts/categories/:id').to(Api::Blog::CategoryShow)

  get('/posts/:id').to(Api::Blog::Show)

  # Splash
  add('/').to(Api::Root)

end
