class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
    	t.integer :hcpcs_code
    	t.string  :hcpcs_description
    	t.float :line_srvc_cnt
    	t.float :bene_unique_cnt
    	t.float :bene_day_srvc_cnt
    	t.float :avg_med_allow_amt
    	t.float :stdev_med_allow_amt
    	t.float :avg_submit_chrg_amt
    	t.float :stdev_submit_chrg_amt
    	t.float :avg_med_payment_amt
    	t.float :stdev_med_payment_amt
    	t.integer :provider_id
      t.timestamps
    end

    add_index :services, :provider_id
  end
end
