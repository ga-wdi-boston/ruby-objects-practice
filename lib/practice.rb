# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines
      def initialize
        @lines = {
          'Red' => Line.new('Red', ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']),

          'Green' => Line.new('Green', [ 'Government Center','Park Street', 'Boylston', 'Arlington','Copley', 'Hynes', 'Kenmore']),
          'Orange' => Line.new('Orange', ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills'])
        }

      end

      def stops_between_stations

    puts 'Park Street'
    #same_line_stop = if startline == endline
     # count_stops = startline.index()




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
        #take all the stations and map them as a class named stations
        @stations = stations.map { |station_name| Station.new(station_name)}
      end

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

p var = Lines.new
