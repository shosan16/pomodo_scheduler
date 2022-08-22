class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, :name, :task_time, :rest_time, :set_number ,presence: true
end
