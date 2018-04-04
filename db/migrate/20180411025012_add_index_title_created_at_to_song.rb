class AddIndexTitleCreatedAtToSong < ActiveRecord::Migration[5.1]
  def change
    add_index :songs, [:created_at, :artist_id]
  end
end
