require 'json'
require 'open-uri'

class PlayersController < ApplicationController
  def index
    call_player_api
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @team = Team.find(params[:team_id])
    @player = Player.new(player_params)
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :price, :is_constructor, :team_id)
  end

  def call_player_api
    url = 'https://fantasy-stage-api.formula1.com/partner_games/f1/players'
    players_serialized = URI.open(url).read
    parsed_players = JSON.parse(players_serialized)

    parsed_players['players'].each do |player|
      @player = Player.find_by(first_name: player['first_name'])
      @team = Team.find_by(name: player['team_name'])
      if @player
        @player.update(first_name: player['first_name'], last_name: player['last_name'], price: player['price'], is_constructor: player['is_constructor'], team_id: @team.id)
      else
        Player.create(first_name: player['first_name'], last_name: player['last_name'], price: player['price'], is_constructor: player['is_constructor'], team_id: @team.id)
      end
    end
  end
end
