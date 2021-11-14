class UserTeam < ApplicationRecord
  belongs_to :user

  has_many :user_team_players, dependent: :destroy
  has_many :players, through: :user_team_players

  validates :name, presence: true

  def budget_remaining(budget = 100)
    budget - players.sum(&:price)
  end
end
