# Check out https://github.com/joshbuddy/http_router for more
# information on HttpRouter.

HttpRouter.new do

  # Posts
  get('/posts').to(PostActions::Index)
  get('/posts/tags').to(PostActions::TagIndex)
  get('/posts/tags/:id').to(PostActions::ShowTag)
  get('/posts/:id').to(PostActions::Show)

  # Data Sets
  get('/*id').to(DataSetActions::Show)

end
