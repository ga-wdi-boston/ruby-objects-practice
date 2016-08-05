# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize(start_line, start_station, end_line, end_station)
        @start_line = start_line
        @start_station = start_station
        @end_line = end_line
        @end_station = end_station
      end

      def stops_between_stations
        (station_to_park(@start_line, @start_station) +
        station_to_park(@end_line, @end_station)).abs
      end

      def station_to_park(line, station)
        # get the number of stops from start to park Street
        if line == 'Red'
          (Line.RED.index('Park Street') - Line.RED.index(station))
        elsif line == 'Green'
          (Line.GREEN.index('Park Street') - Line.GREEN.index(station))
        elsif line == 'Orange'
          (Line.ORANGE.index('Park Street') - Line.ORANGE.index(station))
        end
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line < System
      RED = ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard',
             'Porter', 'Davis', 'Alewife'].frezee
      GREEN = ['Government Center', 'Park Street', 'Boylston', 'Arlington',
               'Copley', 'Hynes', 'Kenmore'].frezee
      ORANGE = ['North Station', 'Haymarket', 'Park Street', 'State',
                'Downtown Crossing', 'Chinatown', 'Back Bay',
                'Forest Hills'].frezee
    end
    # One station
    class Station < Line
    end
  end
end
