class User < ApplicationRecord
  has_secure_password
  has_many :murals
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  validates :password, presence: true, unless: :skip_password_validation

  with_options if: :password do |user|
    user.validates :password, length: {minimum: 5}
    user.validates :password_confirmation, presence: { message: ': Passwords must match'}
  end


  attr_accessor :skip_password_validation

  
end
