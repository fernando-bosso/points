class Player < ApplicationRecord
  MAX_ALLOWED_POINTS = 3126

  has_many :point_entries, dependent: :destroy

  def points
    point_entries.sum(&:value)
  end
end
