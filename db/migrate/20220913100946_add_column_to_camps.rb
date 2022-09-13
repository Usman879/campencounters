class AddColumnToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :title, :string
    add_column :camps, :locations, :string
    add_column :camps, :registration_date, :date
  end
end
