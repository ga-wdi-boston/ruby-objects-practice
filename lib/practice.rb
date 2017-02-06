# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      @inters = ['Park Street', 'Haymarket']
      def initialize
        @red = ['South Station', 'Park Street', 'Kendall',
                'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']
        @green = ['Haymarket', 'Government Center', 'Park Street', 'Boylston',
                  'Arlington', 'Copley', 'Hynes', 'Kenmore']
        @orange = ['North Station', 'Haymarket', 'Park Street', 'State',
                   'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
        @translator = { 'Red' => @red,
                        'Green' => @green,
                        'Orange' => @orange }
        @inters = ['Park Street', 'Haymarket']
      end

      def single_line_dist(line, start_station, stop_station)
        (line.index(start_station) - line.index(stop_station)).abs
      end

      def two_line(start, start_station, stop, stop_station, intersection)
        if start.index(intersection) && stop.index(intersection)
          first_distance = (start.index(start_station) -
          start.index(intersection)).abs
          second_distance = (stop.index(stop_station) -
          stop.index(intersection)).abs
          first_distance + second_distance
        else
          1000
        end
      end

      def multi(start, start_station, stop, stop_station)
        distances = []
        @inters.each do |intersection|
          distances.push(two_line(start, start_station, stop,
                                  stop_station, intersection))
        end
        distances.min
      end

      def stops_between_stations(start, start_station, stop, stop_station)
        start = @translator[start]
        stop = @translator[stop]
        if start == stop
          dist = single_line_dist(start, start_station, stop_station)
        elsif self.class.stretch == false
          dist = two_line(start, start_station, stop, stop_station, @inters[0])
        else
          dist = multi(start, start_station, stop, stop_station)
        end
        dist
      end

      # return true if handling multiple intersections
      def self.stretch
        return false if @inters.length < 2
        true
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :name
      attr_reader :stations
      def initialize(name)
        @name = name
        @stations = []
      end

      def add_line(name)
        @stations.push(name)
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
