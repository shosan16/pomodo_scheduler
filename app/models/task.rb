class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, :name, :rest_time, :set_number ,presence: true
  validates :task_time, :rest_time, presence: true, numericality: {only_integer: true, 
                                      greater_than_or_equal_to: 1, less_than_or_equal_to: 60}
  validates :set_number, presence: true, numericality: {only_integer: true, 
                                      greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
end
