class Character < ApplicationRecord
  belongs_to :account
  has_and_belongs_to_many :clans

  def class_string
    "#{level.ordinalize} level #{class_name}"
  end

  def xp_to_next_level
    return 0 if level == 20
    level * 500
  end

  def level_progress
    return 100 if level == 20
    xp.to_f / xp_to_next_level * 100
  end
end
