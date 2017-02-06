# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      include Math
      attr_reader :red, :green, :orange

      def initialize
        @red = ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard',
                'Porter', 'Davis', 'Alewife']
        @green = ['Government Center', 'Park Street', 'Boylston', 'Arlington',
                  'Copley', 'Hynes', 'Kenmore']
        @orange = ['North Station', 'Haymarket', 'Park Street', 'State',
                   'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
        @change = { 'Red' => @red, 'Green' => @green, 'Orange' => @orange }
      end

      def stops_between_stations(start_line, start_station, end_line,
                                 end_station)
        startline = @change[start_line]
        endline = @change[end_line]
        start_position = startline.index(start_station)
        start_intersection = startline.index('Park Street')
        end_position = endline.index(end_station)
        end_intersection = endline.index('Park Street')

        if start_line == end_line
          (start_position - end_position).abs
        else
          (start_position - start_intersection).abs +
          (end_position - end_intersection).abs
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
