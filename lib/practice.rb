# frozen_string_literal: true

# require 'pry'

# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines
      def initialize
        @lines = {
          'Red' => Line.new('Red', ['South Station', 'Park Street', 'Kendall',
                                'Central', 'Harvard', 'Porter', 'Davis',
                                'Alewife']),
          'Green' => Line.new('Green', ['Haymarket', 'Government Center',
                                    'Park Street', 'Boylston', 'Arlington',
                                    'Copley', 'Hynes', 'Kenmore']),
          'Orange' => Line.new('Orange', ['North Station', 'Haymarket',
                                      'Park Street', 'State',
                                      'Downtown Crossing', 'Chinatown',
                                      'Back Bay', 'Forest Hills'])
        }
      end

      def stops_between_stations(startLine, startStation, endLine, endStation)
        @transfer = 'Park Street'

        @startIndex = lines[startLine].stations.index{|stop| stop.name == startStation}
        @startTransferIndex = lines[startLine].stations.index{|stop| stop.name == @transfer}
        @endIndex = lines[endLine].stations.index{|stop| stop.name == endStation}
        @endTransferIndex = lines[endLine].stations.index{|stop| stop.name == @transfer}

        if startLine == endLine
          (@startIndex - @endIndex).abs
        else
          (@startIndex - @startTransferIndex).abs + (@endIndex - @endTransferIndex).abs
        end

      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    class Line
      attr_reader :name
      attr_reader :stations

      def initialize(name, stations)
        @name = name
        @stations = stations.map { |station| Station.new(station) }
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

# binding.pry
# ''
