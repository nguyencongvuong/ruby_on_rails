class AddColumnNoiBatToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :noi_bat, :integer
  end
end
