class AddAuthorIdToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :author_id, :integer
  end
end
