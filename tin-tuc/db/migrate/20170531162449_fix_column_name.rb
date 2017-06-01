class FixColumnName < ActiveRecord::Migration[5.1]
  def self.up
  	change_column :users,:author_id,:string
  	rename_column :users,:author_id,:name

  end
end
