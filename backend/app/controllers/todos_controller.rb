class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show update destroy ]

  # GET /todos
  def index
    @todos = Todo.all
    render json: { items: @todos }
  end

  # GET /todos/:id
  def show
    render json: { item: @todo }
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_create_params)

    if @todo.save
      render json: { item: @todo }, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/:id
  def update
    if @todo.update(todo_update_params)
      render json: { item: @todo }
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_create_params
      params.require(:todo).permit(:title, :detail)
    end

    def todo_update_params
      params.require(:todo).permit(:isDone)
    end
end
