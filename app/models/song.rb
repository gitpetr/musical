class Song < ApplicationRecord
  belongs_to :artist
  has_many :downloads, dependent: :destroy

  def self.top(size = 100, created_after = 1.month.ago)
    top = top_downloaded(size, created_after)
    top_count = top.map(&:id).count
    return top if top_count == size
    (top + oser_songs(top_count, size)).sort_by(&:title)
  end

  def self.top_downloaded(size, created_after)
    top = []
    downloaded = joins(:downloads).group('songs.id')
      .select('songs.*, count(song_id) as count_downloads').where('downloads.created_at >= ?', created_after)
      .order('count_downloads desc').limit(size)
    downloaded.each { |song| top.push(song) }
    top.sort_by(&:title)
  end

  def self.oser_songs(top_count, size)
    Song.where('id not in(select song_id from downloads)').limit(size - top_count)
  end
end
