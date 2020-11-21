# frozen_string_literal: true
# rubocop:disable all
class Song
  @@id = 0

  def initialize(title:, **rest)
    @id = rest[:id] || next_id
    @@id = @id if @id > @@id
    @title = title
    @artists = rest[:artists] || []
    @album = rest[:album] || ''
    @released = rest[:released]
  end

  def to_h
    { id: @id, title: @title, artists: @artists, album: @album, released: @released }
  end

  def next_id
    @@id += 1
  end
end
