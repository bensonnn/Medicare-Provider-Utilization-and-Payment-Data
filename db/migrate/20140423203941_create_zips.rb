class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
    	t.integer :zip
    	t.string :arcs
    	t.float :avg_1
    	t.float :avg_2
    	t.float :avg_3
      t.timestamps
    end

    add_index :zips, :zip
  end
end
