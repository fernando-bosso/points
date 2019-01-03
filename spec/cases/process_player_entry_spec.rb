# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProcessPlayerEntry, type: :model do
  let(:entry_line) { { player_id: player.id, value: 150, date: '2019-03-14' } }

  describe '#execute!' do
    subject { ProcessPlayerEntry.new(entry_line).execute! }

    context 'when player has no previous entry' do
      let(:player) { create :player }

      it 'changes player score' do
        subject
        expect(player.reload.points).to eq(entry_line[:value])
      end
    end

    context 'When player already has the max number of points' do
      let(:player) { create(:player, :with_max_points) }

      it 'does not changes player score' do
        subject
        expect(player.reload.points).to eq(Player::MAX_ALLOWED_POINTS)
      end
    end

    context 'When player will surpass the limit with current line entry' do
      let(:player) { create :player }
      let!(:point_entry) { create(:point_entry, player: player, value: Player::MAX_ALLOWED_POINTS - 20) }

      it 'does not changes player score' do
        subject
        expect(player.reload.points).to eq(Player::MAX_ALLOWED_POINTS)
        expect(player.point_entries.last.value).to eq(20)
      end
    end
  end
end
