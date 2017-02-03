# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      LINES = [].map(&:freeze)
      def initialize
        # green = Line.new(['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore'])
      end

      def stops_between_stations(initial_line, initial_stop, final_line, final_stop)
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :name, :stops

      def initialize(name, stops)
        @name = name
        @stops = stops
      end
    end
    # One station
    class Station
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end
  end
end
