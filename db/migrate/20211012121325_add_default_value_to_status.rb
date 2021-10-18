class AddDefaultValueToStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :status, :boolean, default: false
  end
end
