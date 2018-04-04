90_000.times do
  artist = Artist.create({name: Faker::Name.name})
  5.times do
    Song.create(title: Faker::Book.title, artist_id: artist.id)
  end 
end

500_000.times do
  Download.create(song_id: rand(500_000..900_000))
end
 
