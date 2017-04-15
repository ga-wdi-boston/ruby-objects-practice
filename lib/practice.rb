# frozen_string_literal: true

# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :subway
      def initialize
        @subway = {
          Red: Line.new('Red', ['South Station',
                                'Park Street',
                                'Kendall',
                                'Central',
                                'Harvard',
                                'Porter',
                                'Davis',
                                'Alewife']),
          Green: Line.new('Green', ['Government Center',
                                    'Park Street',
                                    'Boylston',
                                    'Arlington',
                                    'Copley',
                                    'Hynes',
                                    'Kenmore']),
          Orange: Line.new('Orange', ['North Station',
                                      'Haymarket',
                                      'Park Street',
                                      'State',
                                      'Downtown Crossing',
                                      'Chinatown',
                                      'Back Bay',
                                      'Forest Hills'])
        }
      end

      def stops_between_stations(line_a, station_a, line_b, station_b)
        if line_a == line_b
          subway[line_a.to_sym].distance_between_stations station_a, station_b
        else
          start_stops = subway[line_a.to_sym].distance_from_intersection station_a
          end_stops = subway[line_b.to_sym].distance_from_intersection station_b
          start_stops + end_stops
          # stops between start and intersection, then stops between
        end
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
        @stations = stations
      end

      def distance_from_intersection(station)
        (stations.index(station) - stations.index('Park Street')).abs
      end

      def distance_between_stations(station1, station2)
        (stations.index(station1) - stations.index(station2)).abs
      end
    end

    # One station
    class Station
      attr_reader :name
      def initialize(name)
        @name = name
        @intersection
      end
    end
  end
end
