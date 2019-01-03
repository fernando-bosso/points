# frozen_string_literal: true

class ProcessPlayerPointEntryJob < ApplicationJob
  queue_as :default

  def perform(entry_line)
    ProcessPlayerEntry.new(entry_line).execute!
  end
end
