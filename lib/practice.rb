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
      end

      def stops_between_stations(start_line,
                                 start_station,
                                 stop_line,
                                 stop_station)
        start_line = @translator[start_line]
        stop_line = @translator[stop_line]
        first_distance = (start_line.index(start_station) -
        start_line.index('Park Street')).abs
        second_distance = (stop_line.index(stop_station) -
        stop_line.index('Park Street')).abs
        first_distance + second_distance
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
    end
    # One station
    class Station
      # attr_reader @line, @position
      # def initialize(line, position)
      #   @line = line
      #   @position = position
      # end
    end
  end
end
