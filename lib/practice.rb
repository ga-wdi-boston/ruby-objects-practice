# frozen_string_literal: true
# A namespace

module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_accessor :subway_lines
      def initialize
        @subway_lines = { Red: ['South Station', 'Park Street', 'Kendall',
        'Central', 'Harvard', 'Porter', 'Davis', 'Alewife'], Green:
        ['Government Center', 'Park Street', 'Boylston', 'Arlington',
        'Copley', 'Hynes', 'Kenmore'], Orange: ['North Station', 'Haymarket',
        'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay',
        'Forest Hills'] }
      end

      def stops_between_stations(start, start_st, last, end_st)
        if start == last
          first_stop = @subway_lines[start.to_sym].index(start_st)
          second_stop = @subway_lines[start.to_sym].index(end_st)
          number_of_stops = (first_stop - second_stop).abs
        else
          first_line = subway_lines[start.to_sym].index(start_st)
          intersection_one = subway_lines[start.to_sym].index('Park Street')
          first_part = (first_line - intersection_one).abs
          second_line_start = subway_lines[last.to_sym].index('Park Street')
          second_line_end = subway_lines[last.to_sym].index(end_st)
          second_part = (second_line_start - second_line_end).abs
          final_number = first_part + second_part
        end
      end

# return true if handling multiple intersections
        def self.stretch
          false
        end
    end
  end
end

#     # One line, all the stations on that line
  class Line
    attr_accessor :name
    attr_accessor :stops
    def initialize(name, stops)
      @name = name
      @stop = stops
    end
   end

#   One station
    class Station
      attr_accessor :name
      def initialize(name)
        @name = name
      end
    end
#     end
#   end
# end
