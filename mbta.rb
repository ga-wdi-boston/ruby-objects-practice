require 'pry'

def stop_calculator (start_stop, start_line, end_stop, end_line)

  lines_and_stops = {
  "red_line" => ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall", "Park St.", "South Station"],
  "green_line" => ["Copley", "Arlington", "Boylston", "Park St.", "Government Center", "Haymarket"],
  "orange_line" => ["North Station", "Haymarket", "Park St.", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"]
  }

  start_stop_index = lines_and_stops[start_line].index(start_stop)
  end_stop_index = lines_and_stops[end_line].index(end_stop)
  if start_line == end_line
    stops = (end_stop_index - start_stop_index).abs
  else
    start_line_park_index = lines_and_stops[start_line].index("Park St.")
    end_line_park_index = lines_and_stops[end_line].index("Park St.")
    stops = (start_line_park_index - start_stop_index).abs + (end_line_park_index - end_stop_index).abs
  end
  return "Number of stops: " + stops.to_s
end

binding.pry
""
