# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :red, :green, :orange, :hub
      def initialize
        @red = ['South Station', 'Park Street', 'Kendall', 'Central',
                'Harvard', 'Porter', 'Davis', 'Alewife']
        @green = ['Government Center', 'Park Street', 'Boylston',
                  'Arlington', 'Copley', 'Hynes', 'Kenmore']
        @orange = ['North Station', 'Haymarket', 'Park Street', 'State',
                   'Downtown Crossing', 'Chinatown', 'Back Bay',
                   'Forest Hills']
        @hub = 'Park Street'
        @convert = { 'Red' => @red, 'Green' => @green, 'Orange' => @orange }
      end

      def stops_to_hub(line, station)
        (line.index(station) - line.index(@hub)).abs
      end

      def stops_between_stations(start_line, start_station, end_line,
                                 end_station)
        stops_to_hub(@convert[start_line], start_station) +
          stops_to_hub(@convert[end_line], end_station)
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line < System
      def initialize
      end
    end
    # One station
    class Station < Line
      def intialize
      end
    end
  end
end

p new_system = MBTA::Subway::System.new

p new_system.stops_between_stations('Red', 'Alewife',
                                    'Green', 'Copley')

p new_system.stops_between_stations('Red', 'South Station',
                                    'Orange', 'Forest Hills')
