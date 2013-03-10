Todo.Input.TextFieldWithLength = Ember.TextField.extend
  maxLength: 255
  charsLeft: 255
  valueDidChange: ((element, property, value) ->
    left = @get('maxLength') - element.get(property).length
    @set('charsLeft', left)
  ).observes('value')
  templateName: 'inputs/text_field_with_length'