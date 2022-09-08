# frozen_string_literal: true

#
# Missing top-level documentation
#
class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :country, :string
    add_column :users, :phone_number, :integer
  end
end
