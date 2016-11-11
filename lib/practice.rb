# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      include Math

      attr_accessor :mbta
      attr_reader :line, :station, :start_line, :start_station, :end_line, :end_station

      def initialize
        # create array for each line
        @mbta = {}
        @mbta['Red'] = MBTA::Subway::Line.new('red').stops
        @mbta['Green'] = MBTA::Subway::Line.new('green').stops
        @mbta['Orange'] = MBTA::Subway::Line.new('orange').stops

        # create stations and add to mbta hash
        red = ['South Station', 'Park Street', 'Kendall',
               'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']
        green = ['Government Center', 'Park Street', 'Boylston', 'Arlington',
                 'Copley', 'Hynes', 'Kenmore']
        orange = ['North Station', 'Haymarket', 'Park Street', 'State',
                  'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
        red.each { |i| @mbta['Red'] << MBTA::Subway::Station.new(i).name }
        green.each { |i| @mbta['Green'] << MBTA::Subway::Station.new(i).name }
        orange.each { |i| @mbta['Orange'] << MBTA::Subway::Station.new(i).name }
      end

      def stops_to_park(line, station)
        @line = line
        @station = station

        park_index = @mbta[line].index('Park Street')
        station_index = @mbta[line].index(station)
        (park_index - station_index).abs
      end

      def stops_between_stations(start_line, start_station, end_line, end_station)
        @start_line = start_line
        @start_station = start_station
        @end_line = end_line
        @end_station = end_station

        if start_line == end_line
          start_station_index = @mbta[start_line].index(start_station)
          end_station_index = @mbta[end_line].index(end_station)
          (start_station_index - end_station_index).abs
        else
          start_stops = stops_to_park(start_line, start_station)
          end_stops = stops_to_park(end_line, end_station)
          start_stops + end_stops
        end
        # stops_to_park(start_line, start_station)
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :name
      attr_accessor :stops

      def initialize(name)
        @name = name
        @stops = []
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
