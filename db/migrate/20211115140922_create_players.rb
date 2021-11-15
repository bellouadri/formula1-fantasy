class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :price
      t.boolean :is_constructor
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
