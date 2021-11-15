class Player < ApplicationRecord
  belongs_to :team
  has_many :fantasy_teams, through: :fantasy_team_players
end
