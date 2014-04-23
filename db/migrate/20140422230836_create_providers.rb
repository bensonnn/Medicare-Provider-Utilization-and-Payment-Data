class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
    	t.integer :npi, :unique => true, :null => false
    	t.string :last_org_name, :null => false
    	t.string :first_name
      t.timestamps
    end

    add_index :providers, :npi
  end
end
