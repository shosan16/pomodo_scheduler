class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :task_time
      t.integer :rest_time
      t.integer :set_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
