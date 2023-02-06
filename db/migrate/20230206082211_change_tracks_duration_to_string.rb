class ChangeTracksDurationToString < ActiveRecord::Migration[7.0]
  def up
    change_column :tracks, :duration, :string
  end

  def donw
    change_column :tracks, :duration, :integer
  end
end
