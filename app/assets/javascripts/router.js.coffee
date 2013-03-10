Todo.Router.map () ->
  @resource 'todo_items', () ->
    @route 'new'
    @route 'index'