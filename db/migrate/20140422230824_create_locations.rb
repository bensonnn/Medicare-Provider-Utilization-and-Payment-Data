class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.string :street1
    	t.string :street2
    	t.string :city
    	t.integer :zip
    	t.string :state
    	t.string :country
    	t.integer :provider_id
      t.timestamps
    end

    add_index :locations, :provider_id
  end
end
