class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :tasks, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def total_task_time
    tasks.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).to_a.map do |task|
      task.set_number * task.task_time
    end.sum
  end

  def task_hours
    total_task_time / 60
  end

  def task_minutes
    ((total_task_time / 60.to_f - total_task_time / 60) * 60).round
  end
end
