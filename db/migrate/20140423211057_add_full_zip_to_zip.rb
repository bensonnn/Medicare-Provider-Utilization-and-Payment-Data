class AddFullZipToZip < ActiveRecord::Migration
  def change
  	add_column :zips, :full_zip, :integer
  end
end
