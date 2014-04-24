require 'csv'
require 'json'
# require 'public/zips_us_topo.json'
# path = Rails.root.join('db', 'data.txt')

# ActiveRecord::Base.transaction do

# Conn = ActiveRecord::Base.connection

# CSV.foreach(File.open(path), {headers: true, col_sep: "\t"}) do |row| 
	

# 	provider = Provider.create(npi: row["npi"], 
# 	                last_org_name: row["nppes_provider_last_org_name"],
# 	                first_name: row["nppes_provider_first_name"])

# 	Location.create(street1: row["nppes_provider_street1"],
# 	                street2: row["nppes_provider_street2"],
# 	                city: row["nppes_provider_city"],
# 	                zip: row["nppes_provider_zip"],
# 	                state: row["nppes_provider_state"],
# 	                country: row["nppes_provider_country"],
# 	                provider_id: provider.id)

# 	Service.create(hcpcs_code: row["hcpcs_code"],
# 								 hcpcs_description: row["hcpcs_description"],
# 								 line_srvc_cnt: row["line_srvc_cnt"],
# 								 bene_unique_cnt: row["bene_unique_cnt"],
# 								 bene_day_srvc_cnt: row["bene_day_srvc_cnt"],
# 								 avg_med_allow_amt: row["average_Medicare_allowed_amt"],
# 								 stdev_med_allow_amt: row["stdev_Medicare_allowed_amt"],
# 								 avg_submit_chrg_amt: row["average_submitted_chrg_amt"],
# 								 stdev_submit_chrg_amt: row["stdev_submitted_chrg_amt"],
# 								 avg_med_payment_amt: row["average_Medicare_payment_amt"],
# 								 stdev_med_payment_amt: row["stdev_Medicare_payment_amt"],
# 								 provider_id: provider.id)

# end

# end

# Normalize Zips

# Location.all.map{ |loc| loc.zip.to_s[0..4].rjust(5,'0') }.uniq.each{ |zip| Zip.create(zip: zip) }
# Location.all.each{ |loc| loc.update(short_zip: loc.zip.to_s[0..4].rjust(5,'0').to_i) }

# Collect Arcs

# path = Rails.root.join('public', 'zips_us_topo.json')
# json = JSON.parse(File.read(path))
# json["objects"]["zip_codes_for_the_usa"]["geometries"].each do |poly| 
# 	zip = Zip.find_by(zip: poly["properties"]["zip"].to_i)
# 	zip.update(arcs: poly["arcs"].to_s) unless zip.nil?
# end

# Get some averages

Zip.all.each do |zip|
	length = Location.find_by(short_zip: zip.zip).provider.services.length
	avg = Location.find_by(short_zip: zip.zip).provider.services.map(&:stdev_med_allow_amt).inject(:+) / length
	zip.update(avg_1: avg)
	avg = Location.find_by(short_zip: zip.zip).provider.services.map(&:stdev_submit_chrg_amt).inject(:+) / length
	zip.update(avg_2: avg)
	avg = Location.find_by(short_zip: zip.zip).provider.services.map(&:stdev_med_payment_amt).inject(:+) / length
	zip.update(avg_3: avg)
end


# # Bake some json

# Zip.all.each do |zip|
# 	p zip.zip
# end

	# {"type"=>"Polygon", "properties"=>{"name"=>"MT MEADOWS AREA", "zip"=>"00012", "state"=>"CA"}, "arcs"=>[[0, 1, 2]]}




