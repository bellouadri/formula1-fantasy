class AddPictureToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :picture, :string
  end
end
