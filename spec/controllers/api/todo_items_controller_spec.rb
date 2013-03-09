require 'spec_helper'

describe Api::TodoItemsController do
  let!(:todo_item) { FactoryGirl.create(:todo_item) }
  let!(:todo_item_serialized) { {todo_item: { id: todo_item.id, title: todo_item.title, content: todo_item.content, done: todo_item.done }} }

  let!(:todo_items) { [todo_item] }
  let!(:todo_items_serialized) { {todo_items: [{ id: todo_item.id, title: todo_item.title, content: todo_item.content, done: todo_item.done }]} }

  describe "GET #index" do
    it "assigns array of todo_items" do
      get :index
      assigns(:todo_items).should eq todo_items
    end 

    it "responds with json" do
      get :index, format: :json
      response.body.should eq todo_items_serialized.to_json
    end
  end

  describe "GET #show" do
    it "assigns requested todo_item to @todo_item" do
      get :show, id: todo_item.id
      assigns(:todo_item).should eq todo_item
    end

    it "responds with json" do
      get :show, format: :json, id: todo_item.id
      response.body.should eq todo_item_serialized.to_json
    end
  end

  describe "POST #create" do
    let(:create_todo_item) do
      post :create, 
        todo_item: { title: 'New item', content: 'New content', done: false } 
    end

    it "creates new record in database" do
      expect { create_todo_item }.to change(TodoItem, :count).by(1)
    end

    it "responds with json" do
    end

  end

  describe "PUT #update" do
    let(:update_todo_item) do
      put :update, id: todo_item.id, todo_item: {title: 'super new', content: 'new superior cocntent'}
    end
    let(:updated_todo_item) do
      TodoItem.find(todo_item.id)
    end
    it "assigns requested todo_item to @todo_item" do
      update_todo_item
      assigns(:todo_item).should eq todo_item
    end

    it "updates selected record" do
      update_todo_item
      updated_todo_item.title.should eq 'super new'
    end

    it "responds with json" do
      update_todo_item
      response.body.should eq " "
    end
  end

  describe "DELETE #destroy" do
    let(:delete_todo_item) do
      delete :destroy, id: todo_item.id
    end
    it "assigns requested todo_item to @todo_item" do
      delete_todo_item
      assigns(:todo_item).should eq todo_item
    end
    
    it "destroys selected record" do
      expect{ delete_todo_item }.to change(TodoItem, :count).by(-1)
    end

    it "responds with json" do
      response.body.should eq ""
    end
  end
end
