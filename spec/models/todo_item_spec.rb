require 'spec_helper'

describe TodoItem do
  it "has valid facotory" do
    FactoryGirl.build(:todo_item_done).should be_valid
  end
  
  it "is invalid without title" do
    todo_item = FactoryGirl.build(:todo_item_done, title: nil)
    todo_item.should_not be_valid
  end
  
  it "is invalid without content" do
    todo_item = FactoryGirl.build(:todo_item_done, content: nil)
    todo_item.should_not be_valid
  end

  it "has maximum title length of 255 chars" do
    title = 'a' * 256
    todo_item = FactoryGirl.build(:todo_item_done, title: title)
    todo_item.should_not be_valid
  end

  it "has maximum content length of 255 chars" do
    content = 'a' * 256
    todo_item = FactoryGirl.build(:todo_item_done, content: content)
    todo_item.should_not be_valid
  end

  it "has minimum title length of 3 chars" do
    title = 'a' * 2
    todo_item = FactoryGirl.build(:todo_item_done, title: title)
    todo_item.should_not be_valid
  end

  it "has minimum content length of 3 chars" do
    content = 'a' * 2
    todo_item = FactoryGirl.build(:todo_item_done, content: content)
    todo_item.should_not be_valid
  end
end
