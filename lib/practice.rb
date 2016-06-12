require 'pry'

# A namespace
# module MBTA
# module Subway
# All of the subway lines
class System
  def initialize
    @red_line = ['South Station', 'Park Street', 'Kendall']
  end

  def get_red_line
    @red_line
  end

  def stops_between_stations(startStation, stopStation)
    stops =
  end

  # return true if handling multiple intersections
  def self.stretch
  end
end
# One line, all the stations on that line
class Line
  def initialize(line)
    @line = line
  end

  def get_line
    @line
  end
end
# One station
class Station
end
#   end
# end
