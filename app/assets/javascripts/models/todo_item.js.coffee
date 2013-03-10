Todo.TodoItem = DS.Model.extend
  title: DS.attr('string')
  content: DS.attr('string')
  done: DS.attr('boolean')

  changed: false

  toggleDone: -> 
    @set('done', !@get('done'))
    @set('changed', true)

  becameInvalid: (model) ->
    model.get('transaction').rollback();

  didCreate: () ->
    @set('changed', true)