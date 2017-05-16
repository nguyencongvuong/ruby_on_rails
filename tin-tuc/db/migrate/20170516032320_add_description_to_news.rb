class AddDescriptionToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :description, :text
  end
end
