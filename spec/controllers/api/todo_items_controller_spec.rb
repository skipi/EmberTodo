require 'spec_helper'

describe Api::TodoItemsController do
  let!(:todo_item_done) { FactoryGirl.create(:todo_item_done) }
  let!(:todo_item_done_json) { todo_item_done.as_json(only: [:content, :done, :id, :title]) }
  let!(:todo_item_done_serialized) { {todo_item: todo_item_done_json}}
  let!(:todo_items_done_serialized) { {todo_items: [todo_item_done_json]}}

  let!(:todo_item_not_done) { FactoryGirl.create(:todo_item_not_done) }
  let!(:todo_item_not_done_json) { todo_item_not_done.as_json(only: [:content, :done, :id, :title]) }
  let!(:todo_item_not_done_serialized) { {todo_item: todo_item_not_done_json}}
  let!(:todo_items_not_done_serialized) { {todo_items: [todo_item_not_done_json]}}

  describe "GET #index" do
    context "type 'done' param given" do
      before(:each) { get :index, format: :json, type: 'done' }

      it "assigns array of todo_items" do
        assigns(:todo_items).should eq [todo_item_done]
      end 

      it "responds with json" do
        JSON.parse(response.body).should eq JSON.parse(todo_items_done_serialized.to_json)
      end
    end
    
    context "type 'not_done' param given" do
      before(:each) { get :index, format: :json, type: 'not_done' }
      it "assigns array of todo_items" do
        assigns(:todo_items).should eq [todo_item_not_done]
      end 

      it "responds with json" do
        JSON.parse(response.body).should eq JSON.parse(todo_items_not_done_serialized.to_json)
      end
    end

    context "no type param given" do
      before(:each) { get :index, format: :json}
      let!(:todo_items_combined_serialized) { {todo_items: [todo_item_done_json, todo_item_not_done_json]}}
      it "assigns array of todo_items" do
        get :index
        assigns(:todo_items).should eq [todo_item_done, todo_item_not_done]
      end 

      it "responds with json" do
        JSON.parse(response.body).should eq JSON.parse(todo_items_combined_serialized.to_json)
      end
    end
  end

  describe "GET #show" do
    it "assigns requested todo_item to @todo_item" do
      get :show, id: todo_item_done.id
      assigns(:todo_item).should eq todo_item_done
    end

    it "responds with json" do
      get :show, format: :json, id: todo_item_done.id
      JSON.parse(response.body).should eq JSON.parse(todo_item_done_serialized.to_json)
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
      put :update, id: todo_item_done.id, todo_item: {title: 'super new', content: 'new superior cocntent'}
    end
    let(:updated_todo_item) do
      TodoItem.find(todo_item_done.id)
    end
    it "assigns requested todo_item to @todo_item" do
      update_todo_item
      assigns(:todo_item).should eq todo_item_done
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
      delete :destroy, id: todo_item_done.id
    end
    it "assigns requested todo_item to @todo_item" do
      delete_todo_item
      assigns(:todo_item).should eq todo_item_done
    end
    
    it "destroys selected record" do
      expect{ delete_todo_item }.to change(TodoItem, :count).by(-1)
    end

    it "responds with json" do
      response.body.should eq ""
    end
  end
end
