# frozen_string_literal: true

# A namespace

module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines

      def initialize
        @lines = {
          'red' => Line.new('Red', ['South Station', 'Park Street',
                                    'Kendall', 'Central', 'Harvard', 'Porter',
                                    'Davis', 'Alewife']),
          'green' => Line.new('Green', ['Haymarket', 'Government Center',
                                        'Park Street', 'Boylston', 'Arlington',
                                        'Copley', 'Hynes', 'Kenmore']),
          'orange' => Line.new('Orange', ['North Station', 'Haymarket',
                                          'Park Street', 'State',
                                          'Downtown Crossing', 'Chinatown',
                                          'Back Bay', 'Forest Hills'])
        }
      end

      def stops_between_stations
           (start_line, start_station, end_line, end_station)
        if start_line == end_line
          distance = how_far(start_line, start_station, end_station)
        else
          distance = how_far(start_line, start_station, 'Park Street')
                     how_far(end_line, end_station, 'Park Street')
        end
        distance
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
    end
  end
end
