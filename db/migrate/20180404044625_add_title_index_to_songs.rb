class AddTitleIndexToSongs < ActiveRecord::Migration[5.1]
  def change
    add_index :songs, :title
  end
end
