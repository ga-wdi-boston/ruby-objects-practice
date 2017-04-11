# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize
      end

      def stops_between_stations
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      red = [South Station, Park Street, Kendall, Central, Harvard, Porter, Davis, Alewife]
      green = [Government Center, Park Street, Boylston, Arlington, Copley, Hynes, Kenmore]
      orange = [North Station, Haymarket, Park Street, State, Downtown Crossing, Chinatown, Back Bay, Forest Hills]
    end
    # One station
    class Station
    end
  end
end
