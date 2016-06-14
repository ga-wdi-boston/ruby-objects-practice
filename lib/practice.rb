require 'pry'

# A namespace
# module MBTA
# module Subway
# All of the subway lines
class System
  def initialize
    @red = ['South Station', 'Park Street', 'Kendall']
    @green = ['Government Center', 'Park Street', 'Boylston']
  end

  # def stops_between_stations(startStation, startLine, stopStation, stopLine)
  def stops_between_stations(startStation, startLine, stopStation, stopLine)
    start_line = return_line(startLine)
    stop_line = return_line(stopLine)

    if start_line == stop_line
    stops = start_line.index(startStation) - start_line.index(stopStation)
    else

    end
    puts stops
  end

  def return_line(station)
    if station == 'Red Line'
      return @red
    elsif station == 'Green Line'
      return @green
    end
  end
end
# One line, all the stations on that line
# class Line
#   def initialize(line)
#     @line = line
#   end
#
#   def get_line
#     @line
#   end
# end
# # One station
# class Station
#   def initialize(station)
#     @station = station
#   end
#
#   def get_station
#     @station
#   end
# end

mbta = System.new
mbta.stops_between_stations("Kendall","Red Line","Park Street","Red Line")
