class PlayersController < ApplicationController
  def index
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
end
