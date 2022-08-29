class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user

      date = params[:date]
      date = if date.nil?
               Time.zone.today
             else
               date.to_date
             end
      @tasks = current_user.tasks.where(created_at: date.beginning_of_day..date.end_of_day)
    end
  end
end
