Todo.TodoItem = DS.Model.extend({
  title: DS.attr('string'),
  content: DS.attr('string'),
  done: DS.attr('boolean')
});