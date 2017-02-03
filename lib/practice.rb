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
          'Red' => Line.new('Red', ['South Station', 'Park Street',
                                    'Kendall', 'Central', 'Harvard', 'Porter',
                                    'Davis', 'Alewife']),
          'Green' => Line.new('Green', ['Haymarket', 'Government Center',
                                        'Park Street', 'Boylston', 'Arlington',
                                        'Copley', 'Hynes', 'Kenmore']),
          'Orange' => Line.new('Orange', ['North Station', 'Haymarket',
                                          'Park Street', 'State',
                                          'Downtown Crossing', 'Chinatown',
                                          'Back Bay', 'Forest Hills'])
        }
      end

      def count_stops(line, station1, station2)
        stops = line.stations
        station1_index = stops.index { |s| s.name == station1 }
        station2_index = stops.index { |s| s.name == station2 }
        real_stop = if station1_index <= station2_index
                      stops[station1_index..station2_index]
                    else
                      stops[station2_index..station1_index]
                    end
        real_stop.length - 1
      end

      def stops_between_stations(start_line, start_station,
                                 end_line, end_station)
        if start_line == end_line
          count_stops(@lines[start_line], start_station, end_station)
        else
          num_stop1 = count_stops(@lines[start_line],
                                  start_station, 'Park Street')
          num_stop2 = count_stops(@lines[end_line],
                                  'Park Street', end_station)
          num_stops = num_stop1 + num_stop2
          num_stops
        end
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end

    # One line, all the stations on that line
    class Line
      attr_reader :stations
      attr_reader :name

      def initialize(name, stations)
        @name = name
        @stations = stations.map { |station_name| Station.new(station_name) }
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
