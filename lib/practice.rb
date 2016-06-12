# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize
        @red = ['South Station', 'Park Street', 'Kendall',
                'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']
        @green = ['Government Center', 'Park Street', 'Boylston', 'Arlington',
                  'Copley', 'Hynes', 'Kenmore']
        @orange = ['North Station', 'Haymarket', 'Park Street', 'State',
                   'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
        @translator = { 'Red' => @red,
                        'Green' => @green,
                        'Orange' => @orange }
        @intersections = ['Park Street']
      end

      def single_line_dist(line, start_station, stop_station)
        (line.index(start_station) - line.index(stop_station)).abs
      end

      def two_line_dist(start_line,
                        start_station,
                        stop_line,
                        stop_station)
        first_distance = (start_line.index(start_station) -
        start_line.index(@intersections[0])).abs
        second_distance = (stop_line.index(stop_station) -
        stop_line.index(@intersections[0])).abs
        first_distance + second_distance
      end

      def stops_between_stations(start_line, start_station,
                                 stop_line, stop_station)
        start_line = @translator[start_line]
        stop_line = @translator[stop_line]
        if start_line == stop_line
          distance = single_line_dist(start_line, start_station, stop_station)
        else
          distance = two_line_dist(start_line, start_station,
                                   stop_line, stop_station)
        end
        distance
      end

      # return true if handling multiple intersections
      def self.stretch
        # return false if @intersections.length == 1
        # true
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :name
      attr_reader :stations
      def initialize(name)
        @name = name
        @stations = []
      end

      def add_line(name)
        @stations.push(name)
      end
    end
    # One station
    class Station
      attr_reader :name
      def initialize(name)
        @name = name
      end
    end
  end
end
