class ChangeTracksDurationToString < ActiveRecord::Migration[7.0]
  def change
    change_column :tracks, :duration, :string
  end
end
