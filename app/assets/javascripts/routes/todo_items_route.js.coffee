class Todo.TodoItemsRoute extends Ember.Route
  model: () ->
    Todo.TodoItem.find()
  setupController: (controller, model) ->
    controller.set('content', model)
