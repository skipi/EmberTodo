Todo.Router.map () ->
  @resource('todo_items', path: '/')
  @resource('todo_item', path: '/todo/:todo_id')
