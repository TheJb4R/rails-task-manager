class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task.id)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  def create
    @task = Task.create(task_params)
    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :complete)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
