class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @tasks = current_user.tasks.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day)
    end
  end
end
