# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      RED_LINE = ['South Station', 'Park Street', 'Kendall', 'Central',
                  'Harvard', 'Porter', 'Davis', 'Alewife']
      GREEN_LINE = ['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore' ]
      ORANGE_LINE = ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']

      attr_reader :red_line, :orange_line, :green_line, :lines
      def initialize
        @red_line = Line.new([Station.new('South Station', 'N'), Station.new('Park Street', 'Y'), Station.new('Kendall', 'N'),
                              Station.new('Central', 'N'), Station.new('Harvard', 'N'), Station.new('Porter', 'N'),
                              Station.new('Davis', 'N'), Station.new('Alewife', 'N')])
        @green_line = Line.new([Station.new('Government Center', 'N'), Station.new('Park Street', 'Y'), Station.new('Boylston', 'N'),
                                Station.new('Arlington', 'N'), Station.new('Copley', 'N'), Station.new('Hynes', 'N'), Station.new('Kenmore', 'N')])
        @orange_line = Line.new([Station.new('North Station', 'N'), Station.new('Haymarket', 'N'), Station.new('Park Street', 'Y'), Station.new('State', 'N'),
                                 Station.new('Downtown Crossing', 'N'), Station.new('Chinatown', 'N'), Station.new('Back Bay', 'N'), Station.new('Forest Hills', 'N')])
        @lines = [@red_line, @green_line, @orange_line]
      end

      def stops_between_stations(station1, station2)
        distance = 0
        stop1 = 0
        stop2 = 0
        i = 0
        lines.select do |line|
          line.stations.select do |stations|
            p line.stations
          end
          i += 1
        end
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :stations
      def initialize(stations)
        @stations = stations
      end
    end
    # One station
    class Station
      attr_reader :name, :parkst
      def initialize(name, parkst)
        @name = name
        @parkst = parkst
      end
    end
  end
end
