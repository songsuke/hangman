class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :word, index: true, foreign_key: true
      t.string :current_playing, default: ''

      t.timestamps null: false
    end
  end
end
