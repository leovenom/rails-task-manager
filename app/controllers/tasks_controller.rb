class TasksController < ApplicationController

  def index
   @tasks = Task.all
  end

  def details
    @task = Task.find(params[:id])

  end
end
