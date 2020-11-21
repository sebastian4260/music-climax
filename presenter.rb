# frozen_string_literal: true
# rubocop:disable all
module Presenter
  def print_playlist
    table = Terminal::Table.new
    table.title = 'Music Climax'
    table.headings = %w[ID List Description Songs]
    table.rows = @store.map do |play_list|
      [play_list.id, play_list.name, play_list.description, "#{play_list.songs.size} Songs"]
    end
    puts table
  end
end
