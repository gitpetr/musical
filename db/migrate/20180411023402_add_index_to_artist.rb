class AddIndexToArtist < ActiveRecord::Migration[5.1]
  def change
    add_index :artists, :name
  end
end
