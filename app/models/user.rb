class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :trackable, :confirmable

  validates :phone_number, :presence => true, :numericality => true, :length => { :minimum => 10, :maximum => 15 }
end
