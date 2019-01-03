# frozen_string_literal: true

class ProcessPointEntriesJob < ApplicationJob
  queue_as :process_points

  def perform(entries)
    entries.each { |entry_line| ProcessPlayerPointEntryJob.new.perform(entry_line) }
  end
end
