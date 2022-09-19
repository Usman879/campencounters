class AddOtherAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :integer
    add_column :users, :address, :string
    add_column :users, :feedback, :string
  end
end
