class AddDeadlineToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :deadline, :timestamp
  end
end
