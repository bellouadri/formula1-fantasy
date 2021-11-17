class FantasyTeamPlayersController < ApplicationController
  def index
    @fantasy_team_players = FantasyTeamPlayer.all
  end

  def new
    @fantasy_team_player = FantasyTeamPlayer.new
  end

  def create
    @fantasy_team_player = FantasyTeamPlayer.new(fantasy_team_player_params)
    # @fantasy_team_player = FantasyTeamPlayer.new(params.permit(:fantasy_team_id, :player_id))
    # redirect_to players_path
  end

  def update
    @fantasy_team_player = FantasyTeamPlayer.find(params[:id])
    # @fantasy_team_player.update(fantasy_team_player_params)
    @fantasy_team_player.update(:fantasy_team_id, :player_id)
  end

  private

  def fantasy_team_player_params
    # params.require(:fantasy_team_player).each { |param| param.permit(:fantasy_team_id, :player_id) }
    params.require(:fantasy_team_player).permit(:fantasy_team_id, :player_id)
  end
end

# FantasyTeamPlayer.create([{ fantasy_team_id: 1, player_id: 6 }, { fantasy_team_id: 2, player_id: 10 }])
