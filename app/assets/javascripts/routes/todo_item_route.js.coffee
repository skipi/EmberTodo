class Todo.TodoItemRoute extends Ember.Route
  model: (params)->
    Todo.TodoItem.find(params.todo_id)
  setupController: (controller, model) ->
    controller.set('content', model)
