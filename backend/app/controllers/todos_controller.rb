class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show ]

  # GET /todos
  def index
    @todos = Todo.all
    render json: { items: @todos }
  end

  # GET /todos/:id
  def show
    render json: { item: @todo}
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end
end
