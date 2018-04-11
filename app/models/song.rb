class Song < ApplicationRecord
  belongs_to :artist
  has_many :downloads, dependent: :destroy

  def self.top
    top = joins(:downloads).group('songs.id')
      .select('songs.*, count(song_id) as count_downloads').where('downloads.created_at >= ?', 1.month.ago)
      .order('count_downloads desc').limit(100)
    top_ids = top.map(&:id)
    top_count = top_ids.count
    return top if top_count == 100
    oser_songs = Song.where('songs.id not in(?)', top_ids).limit(100 - top_count)
    top + oser_songs
  end
end
