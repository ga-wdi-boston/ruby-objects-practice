# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :mbta
      def initialize
        @mbta {
          'Red' => ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard',
                   'Porter', 'Davis', 'Alewife'],
          'Green' => ['Government Center', 'Park Street', 'Boylston', 'Arlington',
                     'Copley', 'Hynes', 'Kenmore'],
          'Orange' => ['North Station', 'Haymarket', 'Park Street', 'State',
                      'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
        }
      end

      def stops_between_stations(start_line, start_station, end_line, end_station)
        start = mbta[start_line].index(start_station)
        start_park_street = mbta[start_line].index('Park Street')
        stops_to_park = (start_park_street - start).abs
        ends = mbta[end_line].index(end_station)
        end_park_street = mbta[end_line].index('Park Street')
        stops_from_park = (end_park_street - ends).abs
        stops_to_park + stops_from_park
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :color
      def initialize(color)
        @color = color
      end
    end
    # One station
    class Station
    end
  end
end
