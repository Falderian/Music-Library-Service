class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, null: false, unique: true
      t.string :password, null:false
      t.integer :version, default: 0

      t.timestamps
    end
  end
end
