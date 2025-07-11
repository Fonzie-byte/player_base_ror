class Account < ApplicationRecord
  has_secure_password

  has_one :player
  has_many :characters
  has_many :clans
end
