class Player < ApplicationRecord
  has_many :point_entries, dependent: :destroy

  def points
    point_entries.sum(&:value)
  end
end
