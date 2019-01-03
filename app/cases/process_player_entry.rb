# frozen_string_literal: true

class ProcessPlayerEntry
  def initialize(entry_line)
    @player = Player.find(entry_line[:player_id])
    @entry_value = entry_line[:value].to_i
    @entry_date = entry_line[:date]
  end

  def execute!
    return if player.points >= Player::MAX_ALLOWED_POINTS

    player.point_entries.create(value: allowed_entry_value, date: entry_date)
  end

  private

  attr_reader :entry_date, :entry_value, :player

  def allowed_entry_value
    player.points + entry_value > Player::MAX_ALLOWED_POINTS ? Player::MAX_ALLOWED_POINTS - player.points : entry_value
  end
end
