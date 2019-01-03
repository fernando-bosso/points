# frozen_string_literal: true

class PlayersController < ApplicationController
  def index
    @players = Player.includes(:point_entries).all
  end

  def show
    @player = Player.includes(:point_entries).find(params[:id])
  end
end
