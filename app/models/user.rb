class User < ApplicationRecord
  has_secure_password # to BCrypt the password

  validates :email, presence: true # to validate the email field
end
