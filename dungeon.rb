class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end

  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end


  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

  class Player
    attr_accessor :name, :location

    def initialize(name)
      @name = name
    end
  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end

    def full_description
      @name + "\n\nYou are in " + @description
    end
  end

end

# Start game, get player_name
puts "Please enter your name to start the game!"
player_name = gets.chomp.to_s
while player_name.length == 0
  puts "Sorry, try again.  Please enter your name to start the game!"
  player_name = gets.chomp.to_s
end
my_dungeon = Dungeon.new(player_name)


# Add rooms to the dungeon
my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave, :south => :torture_chamber, :north => :catacomb, :east => :largecave })
my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", { :east => :largecave, :south => :torture_chamber, :north => :catacomb, :west => :smallcave })
my_dungeon.add_room(:torture_chamber, "Torture Chamber", "a horrific room filled with torture devices", { :west => :smallcave, :east => :largecave, :north => :catacomb, :south => :torture_chamber  })
my_dungeon.add_room(:catacomb, "Catacombs", "a dark and creepy maze of catacombs", { :west => :smallcave, :east => :largecave, :south => :torture_chamber, :north => :catacomb })

# User picks direction to travel
my_dungeon.start(:largecave)
loop do
  puts "Which direction now? Enter 'north', 'south', 'east', or 'west'.  Type 'exit' to quit."
  player_input = gets.chomp.downcase.to_sym
  if player_input == :exit
    break
  elsif player_input == :north || player_input == :south || player_input == :east || player_input == :west
    my_dungeon.go(player_input)
  else
    puts "Sorry, I didn't get that.  Please try again."
  end
end

