class Player < ApplicationRecord
  belongs_to :account
  before_destroy :delete_action

  def full_name
    [ first_name, last_name ].join(" ")
  end

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  private

  def delete_action
    account.destroy
  end
end
