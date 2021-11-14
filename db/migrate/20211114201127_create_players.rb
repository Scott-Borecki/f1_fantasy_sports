class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :price, precision: 3, scale: 1
      t.boolean :is_constructor
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
