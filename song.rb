class Song
  @@id = 0

  def initialize(title:, **rest)
    @id = id
    @title = title
    @artists = rest[:artists] || []
    @album = album
    @released = released
  end
end

song = Song.new(title: 'A punto de estallar', artists: ["N'Klabe"], album: 'A punto de estallar', released: 2006)
p song
