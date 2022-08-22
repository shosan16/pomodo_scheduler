class TasksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to countdown_path(task_id: @task.id)
    else
      render 'new'
    end
  end

  def countdown
    @task = Task.find_by(id: params[:task_id])
    if @task == nil?
      redirect_to new_task_path
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :task_time, :rest_time, :set_number)
    end
end
