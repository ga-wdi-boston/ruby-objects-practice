# frozen_string_literal: true

# stops_between_stations('Orange', 'North Station', 'Green', 'Boylston') == 3
# stops_between_stations('Red', 'South Station', 'Orange', 'North Station') == 3
# stops_between_stations('Red', 'South Station', 'Green', 'Boylston') == 2
# stops_between_stations('Red', 'Alewife', 'Orange', 'Forest Hills') == 11

# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines

      def initialize
        @lines = {
          'Red' => ['South Station', 'Park Street', 'Kendall', 'Central',
                    'Harvard', 'Porter', 'Davis', 'Alewife'],
          'Green' => ['Government Center', 'Park Street', 'Boylston',
                      'Arlington', 'Copley', 'Hynes', 'Kenmore'],
          'Orange' => ['North Station', 'Haymarket', 'Park Street', 'State',
                       'Downtown Crossing', 'Chinatown', 'Back Bay',
                       'Forest Hills']
        }
      end

      # returns the number of stops between stations on different lines
      def stops_between_stations(
          start_line, start_station,
          end_line, end_station
      )
        # puts "#{start_line} - #{start_station} to
        #   #{end_line} - #{end_station}"

        if start_line == end_line
          distance = how_far(start_line, start_station, end_station)
        else
          distance = how_far(start_line, start_station, 'Park Street') +
                     how_far(end_line, end_station, 'Park Street')
        end
        distance
      end

      def how_far(line, start_station, end_station)
        # puts "how_far: #{line}: #{start_station}
        #   (#{lines[line].index(start_station)}) -> #{end_station}
        #   (#{lines[line].index(end_station)})"

        distance = (lines[line].index(start_station) -
          lines[line].index(end_station))

        distance.abs
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
