class AddAttributesToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :camp_type, :integer
    add_column :camps, :camp_status, :integer
    add_column :camps, :applicant_registration_start_date, :date
    add_column :camps, :applicant_registration_start_time, :time
    add_column :camps, :applicant_registration_end_date, :date
    add_column :camps, :applicant_registration_end_time, :time
    add_column :camps, :parent_application_start_date, :date
    add_column :camps, :parent_application_start_time, :time
    add_column :camps, :parent_application_end_date, :date
    add_column :camps, :parent_application_end_time, :time
    remove_column :camps, :registration_date, :date
  end
end
