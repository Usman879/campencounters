# frozen_string_literal: true
require 'csv'
class User < ApplicationRecord
  paginates_per 5

  has_one_attached :image

  def thumbnail
    return self.image.variant(resize: '300x200!')
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def self.to_csv
    attributes = %w{ id first_name last_name email country phone_number }

    CSV.generate(headers: true ) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map {|attr| user.send(attr)}
      end
    end
  end
  attribute :agreement, :integer
  validates :agreement, acceptance: { accept: 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  validates :phone_number, presence: true, numericality: true, length: { minimum: 10, maximum: 15 }
  validates :email, uniqueness: true, presence: { case_sensitive: false }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 10 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 10 }
  validates :password, presence: true, confirmation: true,
  format: {
   with: /\A[a-zA-Z0-9. ! @ # $ % ^ & * ( ) _ - + =]+\Z/,
   message: '(minimum 7 characters with at least one capital letter and a special character)'
  }

  scope :simple_users, -> { where(type: nil) }
end
