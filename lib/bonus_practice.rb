# A namespace
module MBTA
  # subway module
  module Subway
    # All of the subway lines
    class System
      attr_reader :red, :green, :orange
      def initialize
        @red = ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']
        @green = ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore']
        @orange = ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
        @line = { 'Red' => @red, 'Green' => @green, 'Orange' => @orange }
      end

      def stops_between_stations(start_line, start_stop, end_line, end_stop)
        start = @line[start_line]
        stop = @line[end_line]
        start_pos = start.index(start_stop)
        end_pos = stop.index(end_stop)
        start_park = start.index('Park Street')
        end_park = stop.index('Park Street')
        start_hay = start.index('Haymarket')
        end_hay = stop.index('Haymarket')

        if start == stop
          (start_pos - end_pos).abs
        elsif self.stretch
          trip_length_check
        else
          trip_park
        end
      end

      def trip_park(start_pos, start_park, end_park, end_pos)
        (start_pos - start_park).abs + (end_park - end_pos).abs
      end

      def trip_hay(start_pos, start_hay, end_hay, end_pos)
        (start_pos - start_hay).abs + (end_hay - end_pos).abs
      end

      def trip_length_check(trip_hay, trip_park)
        if trip_hay(start_pos, start_hay, end_hay, end_pos) < trip_park(start_pos, start_park, end_park, end_pos)
          trip_hay
        else
          trip_park
        end
      end

      # return true if handling multiple intersections
      def self.stretch
        start.include?('Haymarket')
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
