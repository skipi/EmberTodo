class Api::TodoItemsController < ApplicationController
  respond_to :json
  def index
    @todo_items = TodoItem.all

    respond_with @todo_items
  end

  def show
    @todo_item = TodoItem.find(params[:id])

    respond_with @todo_item
  end

  def create
    @todo_item = TodoItem.create(params[:todo_item])

    respond_with @todo_item
  end

  def update
    @todo_item = TodoItem.find(params[:id])

    respond_with @todo_item.update_attributes(params[:todo_item])

  end

  def destroy
    @todo_item = TodoItem.find(params[:id])

    respond_with @todo_item.delete
  end
end
