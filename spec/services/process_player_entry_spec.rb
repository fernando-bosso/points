# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PointsFileProcessor, type: :model do
  let(:file_path) { './test.csv' }
  let!(:player1) { create(:player, id: 1) }
  let!(:player2) { create(:player, id: 2) }
  let!(:player3) { create(:player, id: 3) }
  let!(:player4) { create(:player, id: 4) }

  describe '#execute!' do
    subject { PointsFileProcessor.new(file_path).execute! }

    it 'enqueues job' do
      expect { subject }.to change(PointEntry, :count).by(4)
    end
  end
end
