class UserTeam < ApplicationRecord
  belongs_to :user

  has_many :user_team_players, dependent: :destroy
  has_many :players, through: :user_team_players

  validates :name, presence: true
end
