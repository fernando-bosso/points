# frozen_string_literal: true

require 'csv'

class PointsFileProcessor
  def initialize(file_path)
    @file_data = File.read(file_path)
  end

  def execute!
    ProcessPointEntriesJob.new.perform(entry_lines_array)
  end

  private

  KEYS = %i[date player_name player_id value].freeze

  def entry_lines_array
    CSV.parse(@file_data, col_sep: ';').map { |a| Hash[KEYS.zip(a)] }
  end
end
