# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize (origin_line, origin_station, end_line, end_station)
        @origin_line = origin_line
        @origin_station = origin_station
        @end_line = end_line
        @end_station = end_station
      end

      def stops_between_stations

        start =
        if (@origin_line == 'Orange')
        Line::ORANGE.select do |station|
           station.stop == @origin_station
         end
       elsif (@origin_line == 'Red')
         Line::RED.select do |station|
            station.stop == @origin_station
          end
        elsif (@origin_line == 'Green')
          Line::GREEN.select do |station|
             station.stop == @origin_station
           end
         end

       stop =   if (@end_line == 'Orange')
         Line::ORANGE.select do |station|
            station.stop == @end_station
          end
        elsif (@end_line == 'Red')
          Line::RED.select do |station|
             station.stop == @end_station
           end
         elsif (@end_line == 'Green')
           Line::GREEN.select do |station|
              station.stop == @end_station
            end
          end

          unless @origin_line == @end_line
        distance = (stop[0].val).abs + (start[0].val).abs
        puts "\n\tYou got on the MBTA at #{@origin_station} on the #{@origin_line} line and got off at #{@end_station} on the #{@end_line} line. The distance you travaled is #{distance} stops, you had to change lines."
      else
        same_line = (stop[0].val - start[0].val).abs
        puts "\n\tYou got on the MBTA at #{@origin_station} on the #{@origin_line} line and got off at #{@end_station} on the #{@end_line} line. The distance is #{same_line} stops on the same line."
      end
      end
    end

    class Station
      attr_accessor :stop
      attr_accessor :val

      def initialize(stop, val)
        @stop = stop
        @val = val
      end
    end

    class Line
      ORANGE = [Station.new('North Station', -2), Station.new('Haymarket', -1), Station.new('Park Street', 0), Station.new('State', 1), Station.new('Downtown Crossing', 2), Station.new('Chinatown', 3), Station.new('Back Bay', 4), Station.new('Forest Hills', 5)].map(&:freeze)

      RED = [Station.new('South Station', -1), Station.new('Park Street', 0), Station.new('Kendall', 1), Station.new('Central', 2), Station.new('Harvard', 3), Station.new('Porter',4), Station.new('Davis',5), Station.new('Alewife', 6)].map(&:freeze)

      GREEN = [Station.new('Government Center', -1), Station.new('Park Street', 0), Station.new('Boylston', 1), Station.new('Arlington', 2), Station.new('Copley', 3), Station.new('Hynes', 4), Station.new('Kenmore', 5)].map(&:freeze)

    end

  end
end

newline = MBTA::Subway::System.new('Orange', 'North Station', 'Red', 'Davis')

newline.stops_between_stations

newline2 = MBTA::Subway::System.new('Red', 'Central', 'Orange', 'Back Bay')

newline2.stops_between_stations

newline2 = MBTA::Subway::System.new('Orange', 'North Station', 'Orange', 'Back Bay')

newline2.stops_between_stations

newline2 = MBTA::Subway::System.new('Green', 'Hynes', 'Green', 'Park Street')

newline2.stops_between_stations
