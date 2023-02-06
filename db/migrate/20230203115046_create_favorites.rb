class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.string :artists, array: true, default: []
      t.string :albums, array: true, default: []
      t.string :tracks, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
