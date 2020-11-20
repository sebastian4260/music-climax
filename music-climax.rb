require_relative "play_list"


include Presenter
include Requester

def initialize(filename = "store.json")
  @filename = filename
  @store = parse_json
end

def start
  print_playlist
  action, id = main_menu

  until action == "exit"
    case action
    when "create" then create_list
    when "show" then show_list(id.to_i)
    when "update" then update_list(id.to_i)
    when "delete" then delete_list(id.to_i)
    else puts "Invalid option"
    end
    print_playlist
    action, id = main_menu
  end
end

def create_list
  list_data = request_list_data
  @store << PlayList.new(list_data)
  save
end

def show_list(id)
  puts "show_list #{id}"
end

def update_list(id)
  current_play_list = @store.find { |play_list| play_list.id == id}
  new_data = request_list_data
  current_play_list.update(new_data)
  save
end

def delete_list(id)
  @store.reject! { |play_list| play_list.id != id}
  save
end

def save
  File.write(@filename, JSON.dump(@store.map(&:to_h)))
end



def parse_json
  data = JSON.parse(File.read(@filename), symbolize_name: true)

  data.map! do |play_list|
    play_list[:songs].map! do |song|
      Song.new
