# frozen_string_literal: true
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

      def stops_between_stations(start_line, start_station, end_line, end_station)
        if start_line == end_line
            start_index = @lines[start_line].stations.find_index{ |station| station.station_name == start_station }
            end_index = @lines[end_line].stations.find_index{ |station| station.station_name == end_station }
            number_stops = (start_index - end_index).abs
            number_stops
        else
            start_index = @lines[start_line].stations.find_index{ |station| station.station_name == start_station }
            park_street_start_index = @lines[start_line].stations.find_index{ |station| station.station_name == 'Park Street' }
            number_stops_start_line = (start_index - park_street_start_index).abs
            end_index = @lines[end_line].stations.find_index{ |station| station.station_name == end_station }
            park_street_end_index = @lines[end_line].stations.find_index{ |station| station.station_name == 'Park Street' }
            number_stops_end_line = (end_index - park_street_end_index).abs
            number_stops_start_line + number_stops_end_line
        end
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :line
      attr_reader :stations
      def initialize(line, stations)
        @line = line
        @stations = stations.map { |station| Station.new(station) }
      end
    # One station
    class Station
      attr_reader :station_name
      def initialize(station_name)
        @station_name = station_name
      end
    end
    end
  end
end

subway = MBTA::Subway::System.new

subway.stops_between_stations('Red', 'Harvard', 'Orange', 'Forest Hills')
