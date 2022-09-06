class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :trackable, :confirmable

  # validates :first_name, :last_name, presence: :true
  # validates :phone_number, presence: true, numericality: { only_integer: true }
end
