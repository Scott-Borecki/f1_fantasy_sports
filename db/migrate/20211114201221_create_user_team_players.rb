class CreateUserTeamPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_team_players do |t|
      t.references :user_team, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
