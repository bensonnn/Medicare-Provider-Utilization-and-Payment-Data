class AddShortZipToLocation < ActiveRecord::Migration
  def change
  	add_column :locations, :short_zip, :integer
  end
end
