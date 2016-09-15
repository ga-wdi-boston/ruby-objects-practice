# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines
      def initialize
        @lines = {
          Red: ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife'],
          Green: ['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore'],
          Orange: ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
        }
      end

      def stops_between_stations(
        start_line,
        start_station,
        end_line,
        end_station
      )

        start_index = @lines[start_line.to_sym].index(start_station)
        end_index = @lines[end_line.to_sym].index(end_station)
        num_stops = 0

        if start_line == end_line
          # get the indices of the two stops
          num_stops = (start_index - end_index).abs
        else
        #  number of stops from start station to Park
          start_park_index = @lines[start_line.to_sym].index('Park Street')
          first_leg = (start_index - start_park_index).abs
          #  number of stops from Park to end station
          end_park_index = @lines[end_line.to_sym].index('Park Street')
          second_leg = (end_park_index - end_index).abs

        # add those numbers
          num_stops = first_leg + second_leg
        end
        num_stops
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
