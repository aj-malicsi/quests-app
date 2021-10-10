class AddCategoryDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :details, :text
  end
end
