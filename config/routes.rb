# Check out https://github.com/joshbuddy/http_router for more
# information on HttpRouter.

HttpRouter.new do

  # Posts
  get('/posts').to(Posts::Index)
  get('/posts/tags').to(Posts::TagIndex)
  get('/posts/tags/:id').to(Posts::ShowTag)
  get('/posts/:id').to(Posts::Show)

  # Data Sets
  get('/*id').to(DataSets::Show)

end
