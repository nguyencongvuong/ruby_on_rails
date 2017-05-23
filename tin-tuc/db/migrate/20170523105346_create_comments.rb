class CreateComments < ActiveRecord::Migration[5.1]
 
  	def self.up
    create_table :comments do |t|
   
    t.timestamps
    end
    def self.down
    drop_table :comments
    end
    end

end
