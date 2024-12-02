class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :name
      t.date :birth_date
      t.string :nacionality

      t.timestamps
    end
  end
end
