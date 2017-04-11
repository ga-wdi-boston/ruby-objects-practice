# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines
      attr_accessor :stop
      def initialize
        @stop = 0
        @lines = { 'Red' => ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard',
                             'Porter', 'Davis', 'Alewife'],
                   'Green'  => ['Government Center', 'Park Street', 'Boylston', 'Arlington',
                                'Copley', 'Hynes', 'Kenmore'],
                   'Orange' => ['North Station', 'Haymarket', 'Park Street', 'State',
                                'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills'] }
      end

      def stops_between_stations(line1, start_station, line2, end_station)
        if line1 == line2
          self.stop = (lines[line1].index(start_station) - lines[line2].index(end_station)).abs
        else
          self.stop = (lines[line1].index(start_station) - lines[line1].index('Park Street')).abs
          self.stop = stop + (lines[line2].index(end_station) - lines[line2].index('Park Street')).abs
        end
        stop
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
