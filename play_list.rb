# frozen_string_literal: true
# rubocop:disable all
class PlayList
  @@id = 0

  def initialize(name:, id: nil, description: '', songs: [])
    @id = id || next_id
    @@id = @id if @id > @@id
    @name = name
    @description = description
    @songs = songs
  end

  def to_h
    { id: @id, name: @name, description: @description, songs: @songs.map(&:to_h) }
  end

  def next_id
    @@id += 1
  end
end
