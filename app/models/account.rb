class Account < ApplicationRecord
  has_secure_password

  has_one :player
  has_many :characters

  validates :username, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 15 }, not_pwned: true, confirmation: true

  def self.dropdown_values
    self.all.order(:username).map { |a| [ a.username, a.id ] }
  end
end
