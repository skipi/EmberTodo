class Todo.Store extends DS.Store
  revision: 11
  adapter:  DS.RESTAdapter.create(url: 'api')

