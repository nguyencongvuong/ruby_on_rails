class CreateAuthors < ActiveRecord::Migration[5.1]
  # def change
  	def self.up
    	create_table :authors do |t|
   			t.string :name
	    	t.string :description
	      	t.timestamps
     	end
    end
     def self.down
     	drop_table :authors 
     end
    # end
  
end
