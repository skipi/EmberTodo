class Todo.NewTodoItemView extends Ember.View.create
  tagName: 'form'
  templateName: 'todo_items/new_todo_item'
  controller: Todo.TodoItemsController

  submit: () ->

  cancelForm: () ->