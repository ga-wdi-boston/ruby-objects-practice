# Your code goes here

# MBTA LAB

require 'pry'

mbta = {
  "red line" =>["south station", "park st", "kendall", "central", "harvard", "porter", "davis", "alewife"],
  "green line" => ["haymarket", "government center", "park st", "boylston", "arlington", "copley"],
  "orange line" => ["north station", "haymarket", "park st", "state", "downtown crossing", "chinatown", "back bay", "forest hills"]
}

def same_line_distance line, start_stop, end_stop, system
  (system[line].index(end_stop) - system[line].index(start_stop)).abs
end

def number_of_stops start_line, start_stop, end_line, end_stop, system
  if start_line == end_line
    same_line_distance(start_line, start_stop, end_stop, system)
  else
    same_line_distance(start_line, start_stop, "park st", system) + same_line_distance(end_line, "park st", end_stop, system)
  end
end

# test
puts "arlington to forest hills: "
puts number_of_stops("green line", "arlington", "orange line", "forest hills", mbta)
puts "alewife to harmarket: "
puts number_of_stops("red line", "alewife", "orange line", "forest hills", mbta)
