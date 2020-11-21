# frozen_string_literal: true
# rubocop:disable all
module Requester
  def main_menu
    puts 'create | show ID | upadte ID | delete ID'
    puts 'exit'
    print '> '
    gets.chomp.strip.split
  end

  def request_list_data
    print 'Name: '
    name = gets.chomp.strip
    print 'Description: '
    description = gets.chomp.strip
    { name: name, description: description }
  end
end
