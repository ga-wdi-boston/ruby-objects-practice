# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
  attr_reader :red, :green, :orange
      def initialize
          @red = {name: 'Red', stops: ['South Station', 'Park Street', 'Kendall',
             'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']}
          @green = {name: 'Green', stops: ['Government Center', 'Park Street', 'Boylston',
            'Arlington', 'Copley', 'Hynes', 'Kenmore']}
          @orange = {name: 'Orange', stops: ['North Station', 'Haymarket', 'Park Street',
            'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']}
      end

      def get_line(line)
        if line == 'Red'
          return red
        elsif line == 'Green'
          return green
        elsif line == 'Orange'
        return orange
      end
      end

      def stops_between_stations(start_line, start_station, end_line, end_station)
          if start_line == end_line
            (get_line(start_line)[:stops].index(start_station) -
            get_line(start_line)[:stops].index(end_station)).abs
          else
            @line1_dist = (get_line(start_line)[:stops].index(start_station) -
            get_line(start_line)[:stops].index('Park Street')).abs
            @line2_dist = (get_line(end_line)[:stops].index(end_station) -
            get_line(end_line)[:stops].index('Park Street')).abs
            @line2_dist + @line1_dist
          end
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
  end
end
