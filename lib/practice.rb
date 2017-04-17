# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines
      def initialize
        @lines = {
          'Red' => Line.new('Red', ['South Station', 'Park Street',
                                    'Kendall', 'Central', 'Harvard', 'Porter',
                                    'Davis', 'Alewife']),
          'Green' => Line.new('Green', ['Haymarket', 'Government Center',
                                        'Park Street', 'Boylston', 'Arlington',
                                        'Copley', 'Hynes', 'Kenmore']),
          'Orange' => Line.new('Orange', ['North Station', 'Haymarket',
                                          'Park Street', 'State',
                                          'Downtown Crossing', 'Chinatown',
                                          'Back Bay', 'Forest Hills'])
}
      end

      def stops_between_stations(start_line, start_station, end_line, end_station)
        if start_line == end_line
          count = lines[start_line].stations.index(start_station) -
                  lines[start_line].stations.index(end_station)

        else
          count = (lines[start_line].stations.index(start_station) -
                  lines[start_line].stations.index('Park Street')).abs +
                  (lines[end_line].stations.index(end_station) -
                  lines[end_line].stations.index('Park Street')).abs
        end
        count.abs
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :stations
      attr_reader :lines
      def initialize(line, stations)
        @line = line
        @stations = stations
      end
    end
  end
end
