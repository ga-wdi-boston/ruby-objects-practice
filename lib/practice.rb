# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize
      end

      def stops_between_stations(start_line, start_station, end_line, end_station)
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :stations, :name
      def initialize(name)
        @name = name
        @line_stations = []
      end
      def add_stations
        @line_stations << Station.sort_stations(name)
      end
    end
    # One station
    class Station
      @@stations = []
      attr_reader :name, :line
      def initialize(name, line)
        @name = name
        @line = line
        @@stations << self
      end
      def self.sort_stations(name)
        @@stations.select { |station| station.line == name }
      end
    end
    south = Station.new('South Station', 'Red')
    kendall = Station.new('Kendall MIT', 'Red')
    central = Station.new('Central', 'Red')
    harvard = Station.new('Harvard', 'Red')
    porter = Station.new('Porter', 'Red')
    davis = Station.new('Davis', 'Red')
    alewife = Station.new('Alewife', 'Red')
    government = Station.new('Government Center', 'Green')
    boylston = Station.new('Boylston', 'Green')
    arlington = Station.new('Arlington', 'Green')
    copley = Station.new('Copley', 'Green')
    hynes = Station.new('Hynes Convention Center', 'Green')
    kenmore = Station.new('Kenmore', 'Green')
    north = Station.new('North Station', 'Orange')
    haymarket = Station.new('Haymarket', 'Orange')
    state = Station.new('State', 'Orange')
    downtown = Station.new('Downtown Crossing', 'Orange')
    chinatown = Station.new('Chinatown', 'Orange')
    back_bay = Station.new('Back Bay', 'Orange')
    forest_hills = Station.new('Forest Hills', 'Orange')
    red = Line.new('Red')
    red.add_stations
    green = Line.new('Green')
    green.add_stations
    orange = Line.new('Orange')
    orange.add_stations
  end
end
