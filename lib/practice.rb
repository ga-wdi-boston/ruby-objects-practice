# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize
        @lines = {
          red: ['SOUTH STATION', 'PARK STREET', 'KENDALL',
                'CENTRAL', 'HARVARD', 'PORTER', 'DAVIS', 'ALEWIFE'],
          green: ['GOVERNMENT CENTER', 'PARK STREET', 'BOYLSTON',
                  'ARLINGTON', 'COPLEY', 'HYNES', 'KENMORE'],
          orange:  ['NORTH STATION', 'HAYMARKET', 'PARK STREET',
                    'STATE', 'DOWNTOWN CROSSING', 'CHINATOWN',
                    'BACK BAY', 'FOREST HILLS']
        }
      end

      def stops_between_stations(line_a, station_a, line_b, station_b)
        if line_a == line_b
          dist_on_line(line_a, station_a, station_b)
        else
          dist_on_line(line_a,
                       station_a,
                       nearest_xfr(line_a, station_a, line_b)) +
            dist_on_line(line_b,
                         station_b,
                         nearest_xfr(line_b, station_b, line_a))
        end
      end

      # Returns the nearest connection point between two lines
      def nearest_xfr(_line_a, _station, _line_b)
        'PARK STREET'
      end

      # Returns distance between two stops on a line
      def dist_on_line(line, station_a, station_b)
        return nil unless stop_num(line, station_a) &&
                          stop_num(line, station_b)
        (stop_num(line, station_a) - stop_num(line, station_b)).abs
      end

      # Returns the station's index on the line
      def stop_num(line, station)
        @lines[line.downcase.to_sym].index(station.upcase)
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
