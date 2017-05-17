class AddCategoryIdToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :category_id, :integer
  end
end
