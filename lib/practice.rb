# frozen_string_literal: true
# A namespace
module MBTA
  # comment
  module Subway
    # All of the subway lines
    class System
      def initialize
      end

      def stops_between_stations(station_one, station_two)
        # determines if station_one and station_two are on the same line,
        # if so subtracts them and returns the absolute value (.abs)
        if station_one
        # finds the difference to park street for both station_one and
        # station_two, then adds them together
        else
        end
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :name
      attr_accessor :stations
      def initialize(name)
        @name = name
        @stations
      end
    end
    # One station
    class Station
      attr_reader :name
      def initialize(name)
        @name = name
      end
    end
    Red = Line.new('red')
    Red.stations = ['South Station', 'Park Street', 'Kendall', 'Central',
      'Harvard', 'Porter', 'Davis', 'Alewife'].each { |name| Station.new(name) }
  end
end
