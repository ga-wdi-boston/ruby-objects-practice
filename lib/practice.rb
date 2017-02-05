# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize
        @mbta = { Red: ['South Station', 'Park Street', 'Kendall',
                        'Central', 'Harvard', 'Porter', 'Davis', 'Alewife'],
                  Green: ['Government Center', 'Park Street', 'Boylston',
                          'Arlington', 'Copley', 'Hynes', 'Kenmore'],
                  Orange: ['North Station', 'Haymarket', 'Park Street', 'State',
                           'Downtown Crossing', 'Chinatown', 'Backbay',
                           'Forest Hills'] }
      end
      # method for calculating the amount of stations taken to destination
      def stops_between_stations(start_color, start_point, end_color, end_point)
        line1_start_station = @mbta[start_color.to_sym].index(start_point)
        line1_end_station = @mbta[start_color.to_sym].index('Park Street')
        line1 = (line1_start_station - line1_end_station).abs
        line2_start_station = @mbta[end_color.to_sym].index('Park Street')
        line2_end_station = @mbta[end_color.to_sym].index(end_point)
        line2 = (line2_start_station - line2_end_station).abs
        line1 + line2
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
