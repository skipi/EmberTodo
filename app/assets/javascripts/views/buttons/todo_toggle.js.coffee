Todo.Button.TodoToggle = Ember.View.extend
  templateName: 'buttons/todo_toggle'
  tagName: 'button'
  classNameBindings: 'context.done:btn-success:btn-danger'
  classNames: ['btn', 'btn-mini']

  click: () ->
    record = @get('context')
    record.toggleDone()
    record.transaction.commit()