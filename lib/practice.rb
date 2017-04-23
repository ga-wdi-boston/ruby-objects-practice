# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr :Red
      def initialize
      end

      Red = "South Station, Park Street, Kendall, Central, Harvard, Porter, Davis, Alewife".split(/\s*,\s*/)
      Green = "Government Center, Park Street, Boylston, Arlington, Copley, Hynes, Kenmore".split(/\s*,\s*/)
      Orange = "North Station, Haymarket, Park Street, State, Downtown Crossing, Chinatown, Back Bay, Forest Hills".split(/\s*,\s*/)

      def stops_between_stations (line_1, station_1, line_2, station_2)
        inital_line = []
        if line_1 == 'Red'
          initial_line = Red
        end
        if line_1 == 'Orange'
          initial_line = Orange
        end
        if line_1 == 'Green'
          initial_line = Green
        end
        if line_2 == 'Red'
          end_line = Red
        end
        if line_2 == 'Orange'
          end_line = Orange
        end
        if line_2 == 'Green'
          end_line = Green
        end
        if line_1 == line_2
          return (initial_line.index(station_1) - initial_line.index(station_2)).abs
        end
        if line_1 != line_2
          distance_to_park1 = (initial_line.index(station_1) - initial_line.index("Park Street")).abs
          distance_to_park2 = (end_line.index(station_2) - end_line.index("Park Street")).abs
          distance_to_park1 + distance_to_park2
        end
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end

    # One line, all the stations on that line
    class Line
      def initialize
        @red_line = red_line
        @green_line = green_line
      end

      def populate_red_line

      end
    end
    # One station
    class Station
      attr :station_name
      def initialize(station_name)
        @station_name = station_name
      end
    end
  end
end
