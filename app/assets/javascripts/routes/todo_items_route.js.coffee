Todo.TodoItemsRoute = Ember.Route.extend
  model: (params) ->
    Todo.TodoItem.find()
  setupController: (controller, model) ->
    controller.set('content', model)
