# frozen_string_literal: true

require 'pry'
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines

      def initialize
        @lines = {
          # Define the key value pairs using a hash rocket
          # Each of these lines will be an instance of the Line class
          'Red' => Line.new('Red', ['South Station', 'Park Street', 'Kendall',
                                    'Central', 'Harvard', 'Porter', 'Davis',
                                    'Alewife']),
          'Green' => Line.new('Green', ['Government Center', 'Park Street',
                                        'Boylston', 'Arlington', 'Copley',
                                        'Hynes', 'Kenmore']),
          'Orange' => Line.new('Orange', ['North Station', 'Haymarket',
                                          'Park Street', 'State',
                                          'Downtown Crossing', 'Chinatown',
                                          'Back Bay', 'Forest Hills'])
        }
      end

      def stops_between_stations (start_line, start_station, end_line, end_station)
        if start_line == end_line
          commute = @lines[start_line].stations
          start_position = commute.index { |i| i.name == start_station }
          end_position = commute.index { |i| i.name == end_station }
          num_stops = (end_position - start_position).abs
        else
          start_line = @lines[start_line].stations
          start_position = start_line.index { |i| i.name == start_station }
          start_intersection = start_line.index { |i| i.name == 'Park Street' }

          end_line = @lines[end_line].stations
          end_position = end_line.index { |i| i.name == end_station }
          end_intersection = end_line.index { |i| i.name == 'Park Street' }

          num_stops = (start_position - start_intersection).abs +
          (end_position - end_intersection).abs
        end
      end

      def self.stretch
      end
    end

    # One line, all the stations on that line
    class Line
      attr_reader :stations
      attr_reader :name

      def initialize(name, stations)
        @name = name
        @stations = stations.map { |stop_name| Station.new(stop_name) }
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

# Test code using the following statements:
# mbta = MBTA::Subway::System.new
# mbta.stops_between_stations("Red", "South Station", "Red", "Harvard")
# result is 4. Correct! :)
