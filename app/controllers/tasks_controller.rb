class TasksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      render 'countdown'
    else
      render 'new'
    end
  end

  def countdown
    if @task.nil?
      redirect_to new_task_path
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :task_time, :rest_time, :set_number)
    end
end
