class RemoveColumnAuthorIdFromNews < ActiveRecord::Migration[5.1]
  def change
    remove_column :news, :author_id, :integer
  end
end
