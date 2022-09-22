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

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com', name: 'ゲストユーザー') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストユーザー'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
