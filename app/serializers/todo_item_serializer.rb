class TodoItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :done
end
