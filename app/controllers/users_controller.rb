class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :following, :followers]
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.order(:id).paginate(page: params[:page])
  end

  def following
    @title = "フォロー中のユーザー"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "あなたをフォローしているユーザー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

end
