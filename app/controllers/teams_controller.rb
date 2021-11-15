require 'json'
require 'open-uri'

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

  def call_team_api
    url = 'https://fantasy-stage-api.formula1.com/partner_games/f1/teams'
    teams_serialized = URI.open(url).read
    parsed_teams = JSON.parse(teams_serialized)

    parsed_teams['teams'].each do |team|
      Team.create(name: team['name'])
    end
  end
end
