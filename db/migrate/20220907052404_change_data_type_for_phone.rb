# frozen_string_literal: true

#
# Missing top-level documentation
#
class ChangeDataTypeForPhone < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
  end
end
