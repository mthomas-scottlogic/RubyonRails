class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  validates :name, presence: { message: "must be provided" }
  validates :email_address, presence: { message: "is required" }, uniqueness: { message: "has already been registered" }
  validates :password, length: { minimum: 6, message: "must be at least 6 characters" }, if: -> { new_record? || !password.nil? }

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
