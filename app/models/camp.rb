require 'csv'
class Camp < ApplicationRecord

  enum camp_type: { Virtual: 0, Physical: 1, Hybrid: 2 }
  enum camp_status: { Inactive: 0, Active: 1 }

  def self.to_csv
    attributes = %w{ id title locations camp_status applicant_registration_start_date }

    CSV.generate(headers: true ) do |csv|
      csv << attributes

      all.each do |camp|
        csv << attributes.map {|attr| camp.send(attr)}
      end
    end
  end

end
