class FantasyTeamsController < ApplicationController
  def index
    @fantasy_teams = FantasyTeam.all
  end

  def new
    @fantasy_team = FantasyTeam.new
  end

  def create
    @fantasy_team = FantasyTeam.new(fantasy_team_params)
  end

  def update
    @fantasy_team = FantasyTeam.find(params[:id])
    @fantasy_team.update(fantasy_team_params)
  end

  private

  def fantasy_team_params
    params.require(:fantasy_team).permit(:name)
  end
end
