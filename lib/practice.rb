# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :stations, :intersection
      def initialize
        @stations = %w(red green orange)
        @intersection = 'Park Street'
      end

      def stops_between_stations(on_line, on_stop, off_line, off_stop)
        start_line = Line.new(on_line)
        finish_line = Line.new(off_line)
        if on_line.eql? off_line
          (start_line.line.find_index(on_stop) - finish_line.line.find_index(off_stop)).abs
        else
          on_line_stops = (start_line.line.find_index(on_stop) - start_line.line.find_index(self.intersection)).abs
          off_line_stops = (finish_line.line.find_index(self.intersection) - finish_line.line.find_index(off_stop)).abs
          on_line_stops + off_line_stops
        end
      end
      # stretch method
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      RED = ['South Station', 'Park Street', 'Kendall', 'Central',
             'Harvard', 'Porter', 'Davis', 'Alewife'].freeze
      GREEN = ['Government Center', 'Park Street', 'Boylston', 'Arlington',
               'Copley', 'Hynes', 'Kenmore'].freeze
      ORANGE = ['North Station', 'Haymarket', 'Park Street', 'State',
                'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills'].freeze
      attr_reader :line
      def initialize(line)
        if line.eql? 'Red'
          @line = RED
        elsif line.eql? 'Green'
          @line = GREEN
        else
          @line = ORANGE
        end
      end
    end
    # One station
    class Station
    end
  end
end
