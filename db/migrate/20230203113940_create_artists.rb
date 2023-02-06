class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.boolean :grammy, default: false

      t.timestamps
    end
  end
end
