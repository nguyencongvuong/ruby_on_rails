class AddColumnUserIdToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :user_id, :integer
  end
end
