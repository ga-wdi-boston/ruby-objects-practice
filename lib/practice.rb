# frozen_string_literal: true
# A namespace

# isn't MBTA the Subway? what is the difference?
# module MBTA
# module Subway

# module MBTA
module MBTA
  red = ["South Station", "Park Street", "Kendall", "Central", "Harvard", "Porter", "Davis", "Alewife"]
  green = ["Government Center", "Park Street", "Boylston", "Arlington", "Copley", "Hynes", "Kenmore"]
  orange = ["North Station", "Haymarket", "Park Street", "State", "Downtown Crossing", "Chinatown", "Back Bay", "Forest Hills"]
  intersection = ["Park Street"]
end

# class System
class System
  include MBTA

  def initialize(red, green, orange, intersection, total_stops)
    @red = red
    @green = green
    @orange = orange
    @intersection = intersection
    @total_stops = total_stops
  end

  # calculates the number of stops between stations on the "MBTA"
  def stops_between_stations
    unless same_line == false then different_lines
    end
  end

  # return true if handling multiple intersections
  def self.stretch=(station_one, station_two)
    if line.includes?(station_one && station_two)
      true
    end
  end

  def different_lines=(station_one, station_two)
    # need to figure a way to have arrays (lines) be connected to each other through the element Park_Street.
  end
end

# One line, all the stations on that line
class Line
  attr_reader :same_line
  include MBTA

  def initialize(line, station_one, station_two)
    @line = line
    @station_one = station_one
    @station_two = station_two
  end

  # calculates the number of stops between stations on same line
  def same_line=(line, station_one, station_two)
    if line.includes?(station_one && station_two)
       on_index = line.index{ |x| x == station_one}
       off_index = line.index{ |x| x == station_two}
       total_stops = off_index - on_index
       # returns total number of stops for the trip.
       p "#{total_stops}"
     end
  end
end

# One station
class Station
  #what is purpose of this class?
end
