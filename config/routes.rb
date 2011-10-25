# Check out https://github.com/joshbuddy/http_router for more
# information on HttpRouter.

HttpRouter.new do

  # API Routes
  get('/blog').to(Api::Blog::Index)
  get('/blog/:id').to(Api::Blog::Show)

  # Splash
  add('/').to(Api::Root)

end
