Todo.NewTodoItemView = Ember.View.extend
  tagName: 'form'
  templateName: 'todo_items/new'
  classNames: ['form-inline']

  submit: () ->
    properties = @getProperties('title', 'content')
    @set('title', '')
    @set('content', '')
    record = Todo.TodoItem.createRecord(properties)
    record.store.commit()
