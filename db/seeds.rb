require 'csv'

path = Rails.root.join('db', 'data.txt')

ActiveRecord::Base.transaction do

Conn = ActiveRecord::Base.connection

CSV.foreach(File.open(path), {headers: true, col_sep: "\t"}) do |row| 
	

	provider = Provider.create(npi: row["npi"], 
	                last_org_name: row["nppes_provider_last_org_name"],
	                first_name: row["nppes_provider_first_name"])

	Location.create(street1: row["nppes_provider_street1"],
	                street2: row["nppes_provider_street2"],
	                city: row["nppes_provider_city"],
	                zip: row["nppes_provider_zip"],
	                state: row["nppes_provider_state"],
	                country: row["nppes_provider_country"],
	                provider_id: provider.id)

	Service.create(hcpcs_code: row["hcpcs_code"],
								 hcpcs_description: row["hcpcs_description"],
								 line_srvc_cnt: row["line_srvc_cnt"],
								 bene_unique_cnt: row["bene_unique_cnt"],
								 bene_day_srvc_cnt: row["bene_day_srvc_cnt"],
								 avg_med_allow_amt: row["average_Medicare_allowed_amt"],
								 stdev_med_allow_amt: row["stdev_Medicare_allowed_amt"],
								 avg_submit_chrg_amt: row["average_submitted_chrg_amt"],
								 stdev_submit_chrg_amt: row["stdev_submitted_chrg_amt"],
								 avg_med_payment_amt: row["average_Medicare_payment_amt"],
								 stdev_med_payment_amt: row["stdev_Medicare_payment_amt"],
								 provider_id: provider.id)

end

end