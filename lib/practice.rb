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

      def single_line_ride
        (start_line.index(end_station) - start_line.index(start_station)).abs
      end

      def single_transfer(start_line, start_station, end_line, end_station)
        first_leg = (start_line.index('Park Street') -
                     start_line.index(start_station)).abs
        second_leg = end_line.index(end_station) - end_line.index('Park Street')
        result = first_leg + second_leg
        puts result
      end

      def stops_between_stations
        if start_line == end_line
          number_of_stops = single_line_ride(start_line, start_station,
                                             end_line, end_station)
        else
          number_of_stops = single_transfer(start_line, start_station, end_line,
                                            end_station)
        end
        puts number_of_stops
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      # red_line = ['South Station', 'Park Street', 'Kendall', 'Central',
      #             'Harvard', 'Porter', 'Davis', 'Alewife']
      # green_line = ['Government Center', 'Park Street', 'Boylston',
      #               'Arlington', 'Copley', 'Hynes', 'Kenmore']
      # orange_line = ['North Station', 'Haymarket', 'Park Street', 'State',
      #                'Downtown Crossing', 'Chinatown', 'Back Bay',
      #                'Forest Hills']
    end
    # One station
    class Station
    end
  end
end
