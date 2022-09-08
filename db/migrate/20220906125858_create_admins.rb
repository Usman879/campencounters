# frozen_string_literal: true

#
# Missing top-level documentation
#
class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do
      my.objects.map(&:timestamps)
    end
  end
end
