class TasksController < ApplicationController

  def index
   @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(check_params_create)

    redirect_to task_path(task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(check_params_update)
    redirect_to task_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def check_params_create
    params.require(:task).permit(:title, :details)
  end

  def check_params_update
    params.require(:task).permit(:title, :details, :completed)
  end
end
