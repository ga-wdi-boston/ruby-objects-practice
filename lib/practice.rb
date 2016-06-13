# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      def initialize
        @red = Line.new(['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter','Davis', 'Alewife'])
        @green = Line.new(['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore'])
        @orange = Line.new(['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills'])
        @subway = {
          'Red' => [],
          'Green' => [],
          'Orange' => []
        }
        @red.array.each_index { |i| @subway['Red'].push(@red.array[i].name) }
        @green.array.each_index { |i| @subway['Green'].push(@green.array[i].name) }
        @orange.array.each_index { |i| @subway['Orange'].push(@orange.array[i].name) }
      end

      def count_stops(stops, station1, station2)
        real_stop = []
        if stops.index(station1) <= stops.index(station2)
          real_stop = stops[stops.index(station1)..stops.index(station2)]
        else
          real_stop = stops[stops.index(station2)..stops.index(station1)]
        end
        real_stop.length - 1
      end

      def stops_between_stations(start_line, start_station, end_line, end_station)
        if start_line == end_line
          count_stops(@subway[start_line], start_station, end_station)
        else
          num_stop1 = count_stops(@subway[start_line], start_station, 'Park Street')
          num_stop2 = count_stops(@subway[end_line], 'Park Street', end_station)
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
      attr_reader :array
      def initialize (array)
        @array = array.map{ |element| element = Station.new(element) }
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
