class AddIndexToDownloads < ActiveRecord::Migration[5.1]
  def change
    add_index :downloads, [:created_at, :song_id]
  end
end
