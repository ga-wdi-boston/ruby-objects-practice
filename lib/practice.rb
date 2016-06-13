# A namespace
module MBTA
  module Subway
    class System
      include Math
      attr_reader :red, :green, :orange
      def initialize
        @red = [
            'South Station',
            'Park Street',
            'Kendall',
            'Central',
            'Harvard',
            'Porter',
            'Davis',
            'Alewife'
        ]

        @orange =
          [
            'North Station',
            'Haymarket',
            'Park Street',
            'State',
            'Downtown Crossing',
            'Chinatown',
            'Back Bay',
            'Forest Hills'
          ]

        @green =
          [
            'Government Center',
            'Park Street',
            'Boylston',
            'Arlington',
            'Copley',
            'Hynes',
            'Kenmore'
          ]
          @line_name = {
            'Red' => @red,
            'Orange' => @orange,
            'Green' => @green
          }

      end

      def stops_between_stations(s_line, s_station, e_line, e_station)
        starting = @line_name[s_line]
        ending = @line_name[e_line]
        if starting == ending
          total_stops = (starting.index(s_station) -
          starting.index(e_station)).abs
          return total_stops
        end

        if starting != ending
          start_to_park = (starting.index(s_station) - starting.index('Park
          Street')).abs
          end_to_park = (ending.index(e_station) -
          ending.index('Park Street')).abs
          total_stops = start_to_park + end_to_park
          return total_stops
        end
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
