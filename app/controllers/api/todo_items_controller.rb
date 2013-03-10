class Api::TodoItemsController < ApplicationController
  respond_to :json
  def index
    @todo_items = TodoItem.scoped

    if type_param != nil
      @todo_items = @todo_items.where(done: type_param)
    end

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

  private

  def type_param
    if params[:type] && (params[:type].in? %w(done not_done))
      return params[:type] == 'done'
    else
      return nil
    end
  end
end
