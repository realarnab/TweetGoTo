class User < ApplicationRecord
  has_secure_password # to BCrypt the password

  validates :email, presence: true, uniqueness: true# to validate the email field
end
# class User < ApplicationRecord
#   has_secure_password # to BCrypt the password

#   validates :email, presence: { message: "can't be blank" },
#                     uniqueness: { message: "has already been taken" },
#                     format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email" }

#   validates :password, presence: { message: "can't be blank" },
#                        length: { minimum: 6, message: "must be at least 6 characters long" },
#                        on: :create
# end
