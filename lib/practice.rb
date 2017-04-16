# frozen_string_literal: true


# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :subway, :lines
      def initialize
        @red_stations = ['South Station', 'Park Street', 'Kendall',
                         'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']
        @green_stations = ['Government Center', 'Park Street', 'Boylston',
                           'Arlington', 'Copley', 'Hynes', 'Kenmore']
        @orange_stations = ['North Station', 'Haymarket', 'Park Street',
                            'State', 'Downtown Crossing', 'Chinatown',
                            'Back Bay', 'Forest Hills']
        @lines = [Line.new('Red', @red_stations),
                  Line.new('Green', @green_stations),
                  Line.new('Orange', @orange_stations)]
      end

      def stops_between_stations(line_a, station_a, line_b, station_b)
        start_stops = line(line_a).intersection_distance station_a
        end_stops = line(line_b).intersection_distance station_b
        start_stops + end_stops
      end

      def line(name)
        index = lines.index { |line| line.name == name }
        lines[index]
      end

      # return true if handling multiple intersections
      def self.stretch
        false
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :stations, :name
      def initialize(name, stations)
        @name = name
        @stations = stations.map { |e| Station.new(e) }
      end

      def intersection_distance(station)
        (position(station) - intersection_position).abs
      end

      def distance_between(station1, station2)
        (position(station1) - position(station2)).abs
      end

      def position(station)
        stations.index { |e| e.name == station }
      end

      def intersection_position
        stations.index { |e| e.name == 'Park Street' }
      end
    end

    # One station
    class Station
      attr_reader :name, :intersection
      def initialize(name)
        @name = name
        @intersection = name == 'Park Street'
      end
    end
  end
end
