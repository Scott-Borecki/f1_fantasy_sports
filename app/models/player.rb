class Player < ApplicationRecord
  belongs_to :team

  has_many :user_team_players, dependent: :destroy
  has_many :user_teams, through: :user_team_players

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 100 }
  validates :is_constructor, inclusion: [true, false]
end
