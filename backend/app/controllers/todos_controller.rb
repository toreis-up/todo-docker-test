class TodosController < ApplicationController
  # GET /todos
  def index
    @todos = Todo.all
    render status: 200, json: {todos: @todos}
  end
end
