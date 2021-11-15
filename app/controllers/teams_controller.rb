class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
