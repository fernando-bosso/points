# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to have_http_status :ok }
  end

  describe 'GET #show' do
    subject { get :show, params: { id: player_id } }

    context 'with existing player' do
      let(:player) { create :player }
      let(:player_id) { player.id }
      it { is_expected.to have_http_status :ok }
    end

    context 'with inexisting player' do
      let(:player_id) { 'foo' }

      it { is_expected.to have_http_status :not_found }
    end
  end
end
