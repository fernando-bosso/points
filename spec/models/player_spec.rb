# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  describe '#points' do
    subject { player.points }

    context 'with no points' do
      let(:player) { create :player }

      it { is_expected.to be_zero }
    end

    context 'with points' do
      let(:player) { create(:player, :with_points) }

      it { is_expected.to eq(player.point_entries.sum(&:value)) }
    end
  end
end
