require 'pry'

# A namespace
# module MBTA
# module Subway
# All of the subway lines
class System
  def initialize
    @red = ['South Station', 'Park Street', 'Kendall']
  end

  # def stops_between_stations(startStation, startLine, stopStation, stopLine)
  def stops_between_stations(startLine,stopLine)
  start_line = return_line(startLine)
  stop_line = return_line(stopLine)
  
    # start_index = get_station(startStation).index(stopStation.get_line)
  end


  def return_line(station)
    if station == 'Red Line'
      return @red
    end
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
  def initialize(station)
    @station = station
  end

  def get_station
    @station
  end
end

mbta = System.new
mbta.stops_between_stations("Red Line","Red Line")
