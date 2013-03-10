Todo.Button.Delete = Ember.View.extend
  templateName: 'buttons/delete'
  tagName: 'button'
  classNameBindings: 'isActive:active'
  classNames: ['btn', 'btn-mini', 'btn-danger']

  click: () ->
    record = @get('context')
    record.deleteRecord()
    record.store.commit()