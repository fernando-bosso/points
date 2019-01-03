class ProcessPointEntriesJob < ApplicationJob
  queue_as :process_points

  def perform(entries)
    entries.each { |entry_line| ProcessPlayerPointEntryJob.new.perform(entry_line) }
  end
end
