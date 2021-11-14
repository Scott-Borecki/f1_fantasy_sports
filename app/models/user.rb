class User < ApplicationRecord
  has_many :user_teams, dependent: :destroy
  has_many :user_team_players, through: :user_teams

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password_confirmation, presence: true

  has_secure_password
end
