# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize
        @mbta = {
          Red: [
            'South Station',
            'Park Street',
            'Kendall',
            'Central',
            'Harvard',
            'Porter',
            'Davis',
            'Alewife'
          ],
          Green: [
            'Government Center',
            'Park Street',
            'Boylston',
            'Arlington',
            'Copley',
            'Hynes',
            'Kenmore'
          ],
          Orange: [
            'North Station',
            'Haymarket',
            'Park Street',
            'State',
            'Downtown Crossing',
            'Chinatown',
            'Back Bay',
            'Forest Hills'
          ]
        }
      end

      def stop_position(stop, line)
        @mbta[line.to_sym].index(stop)
      end

      def stops_on_single_line(start_station, end_station, line)
        stops = stop_position(start_station, line) - stop_position(end_station, line)
        stops.abs
      end

      def stops_between_stations(start_line, start_station, end_line, end_station)
        if start_line == end_line
          stops_on_single_line(start_station, end_station, start_line)
        else
          stops_on_single_line(start_station, 'Park Street', start_line) + stops_on_single_line(end_station, 'Park Street', end_line)
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
