require 'rails_helper'

RSpec.describe ProcessPointEntriesJob, type: :job do
  let(:entries) do
    [
      { player_id: create(:player).id, value: 150, date: '2019-03-14' },
      { player_id: create(:player).id, value: 250, date: '2019-03-13' }
    ]
  end

  describe 'perform' do
    it 'enqueues job for each entry line', :perform_enqueued do
      ActiveJob::Base.queue_adapter = :test
      expect { ProcessPointEntriesJob.perform_now(entries) }.to change(PointEntry, :count).by(2)
    end
  end
end
