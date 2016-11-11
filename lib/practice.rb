# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_accessor :lines, :stretch
      def initialize(lines = read_lines_from_file('lib/lines.txt'))
        @lines = {}
        lines.each { |line| @lines[line.name.to_sym] = line }
      end

      def read_lines_from_file(filename)
        file = File.open(filename)
        lines = []
        until file.eof?
          ln = file.readline
          name, stops = ln.split(':')
          stops = stops.split(',')
          lines << Line.new(name, stops)
        end
        lines
      end

      def get_position(line, stop_name)
        @lines[line.to_sym].get_position(stop_name)
      end

      def stops_between_stations(start_line, start_stop, end_line, end_stop)
        start = get_position(start_line, start_stop)

        finish = get_position(end_line, end_stop)

        cross = [
          get_position(start_line, 'Park Street'),
          get_position(end_line, 'Park Street')
        ]
        cross_alt = [
          get_position(start_line, 'Haymarket'),
          get_position(end_line, 'Haymarket')
        ]

        return (start - finish).abs if end_line == start_line
        # return test_route(start, finish, cross) unless stretch
        [test_route(start, finish, cross),
         test_route(start, finish, cross_alt)].min
      end

      def test_route(start, finish, cross_points)
        (start - cross_points[0]).abs + (finish - cross_points[1]).abs
      end

      def flatten!
        stops = []
        @lines.each_value do |_line|
          stops
        end
        # stops.flatten!
      end

      # return true if handling multiple intersections
      def self.stretch
        true
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :stops, :name
      def initialize(name, stops)
        @name = name
        @stops = stops.map.with_index do |stop_name, index|
          Station.new(stop_name, index, @name)
        end
      end

      def get_position(name)
        pos = flat.find_index(name)
        pos.nil? ? 1000 : pos
      end

      def flat
        @stops.map(&:name)
      end
    end
    # One station
    class Station
      attr_reader :name, :index, :line
      def initialize(name, index, line)
        @name = name.strip
        @index = index
        @line = line
      end
    end
  end
end
