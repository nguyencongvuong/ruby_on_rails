class AddContentToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :content, :text
  end
end
