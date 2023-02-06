class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.integer :artists, array: true, default: []
      t.integer :albums, array: true, default: []
      t.integer :tracks, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
