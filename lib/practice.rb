# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines

    class System
      attr_accessor :lines
      def initialize(lines)
        lines_object = {}
        lines.each { |line| lines_object[line.name.to_sym] = line }
        @lines = lines_object
      end

      def stops_between_stations(_start_line, _start_stop, _end_line, _end_stop)
      end

      def flatten!
        stops = []
        @lines.each do |line|
          puts line
        end
        # stops.flatten!
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :stops, :name
      def initialize(name, stops)
        @name = name
        @stops = stops.map.with_index { |stop_name, index| Station.new(stop_name, index) }
      end
    end
    # One station
    class Station
      attr_reader :name, :index
      def initialize(name, index)
        @name = name.strip
        @index = index
      end
    end
  end
end
