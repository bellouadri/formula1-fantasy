class FantasyTeam < ApplicationRecord
  has_many :players, through: :fantasy_team_players
end
