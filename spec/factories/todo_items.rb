FactoryGirl.define do
  factory :todo_item_not_done, class: :todo_item do
    title "Test title"
    content "Test content"
    done false
  end

  factory :todo_item_done, class: :todo_item do
    title "Test title"
    content "Test content"
    done true
  end
end