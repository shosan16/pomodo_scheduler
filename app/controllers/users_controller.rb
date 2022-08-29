class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[index following followers]
  before_action :set_q, only: %i[index search]

  def show
    @user = User.find(params[:id])
    date = params[:date]
    date = if date.nil?
             Time.zone.today
           else
             date.to_date
           end
    @tasks = @user.tasks.where(created_at: date.beginning_of_day..date.end_of_day)
  end

  def index
    @users = User.all.sort_by do |user|
      user.tasks.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).map do |task|
        task.task_time * task.set_number
      end.sum
    end.reverse.paginate(page: params[:page])

    # where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
    # task.task_time * task.set_number
  end

  def following
    @title = 'フォロー中のユーザー'
    @user  = User.find(params[:id])
    @users = @user.following.sort_by do |user|
      user.tasks.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).map do |task|
        task.task_time * task.set_number
      end.sum
    end.reverse.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'フォロワー'
    @user  = User.find(params[:id])
    @users = @user.followers.sort_by do |user|
      user.tasks.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).map do |task|
        task.task_time * task.set_number
      end.sum
    end.reverse.paginate(page: params[:page])
    render 'show_follow'
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end
end
