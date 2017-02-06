# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines
      # LINES = [].map(&:freeze)
      def initialize
        @lines = [ Line.new('Green', ['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore']),
        Line.new('Red', ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']),
        Line.new('Orange', ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills'])]
      end

      def stops_between_stations(initial_line, initial_stop, final_line, final_stop)
        init = lines.find { |line| line.name == initial_line }
        final = lines.find { |line| line.name == final_line }
        if initial_line == final_line
          init.stops_calc(initial_stop, final_stop)
        else
          init.stops_calc(initial_stop, 'Park Street') + final.stops_calc('Park Street', final_stop)
        end
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
        @stops = stops.map do |stop|
          Station.new(stop, name)
        end
      end

      def stops_calc(initial, final)
        on = stops.index { |stop| stop.name == initial }
        off = stops.index { |stop| stop.name == final }
        (on - off).abs
      end
    end
    # One station
    class Station
      attr_reader :name, :line

      def initialize(name, line)
        @name = name
        @line = line
      end
    end
  end
end
