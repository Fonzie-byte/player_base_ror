class Player < ApplicationRecord
  belongs_to :account
  before_destroy :delete_action

  validates :first_name, :last_name, :email_address, presence: true, length: { maximum: 255 }
  validates :email_address, uniqueness: true, format: { with: /\A[0-9A-Za-z_\-+.]+@[0-9A-Za-z_\-+]+\.[0-9A-Za-z_\-+]{2,}\z/ }

  def full_name
    [ first_name, last_name ].join(" ")
  end

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  private

  def delete_action
    account.destroy
  end
end
