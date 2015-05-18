class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.create(task_params)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status)
  end
end
