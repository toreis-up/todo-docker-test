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

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:title, :detail)
    end
end
