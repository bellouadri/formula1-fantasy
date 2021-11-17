# require 'json'
# require 'open-uri'

class TeamsController < ApplicationController
  def index
    call_team_api
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
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
