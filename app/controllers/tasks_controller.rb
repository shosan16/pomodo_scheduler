class TasksController < ApplicationController
  def new
    @task = current_user.tasks.build if user_signed_in?
  end

  def create
    @task = current_user.tasks.build if user_signed_in?
    if @task.save
      redirect_to countdown_path
    else
      render 'new'
    end
  end

  def countdown
  end

  private
    def task_params
      params.require(:task).permit(:task_name, :task_time, :rest_time, :set_number)
    end
end
