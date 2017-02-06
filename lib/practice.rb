# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines

      RED_LINE_STATIONS = [
        'South Station', 'Park Street', 'Kendall',
        'Central', 'Harvard', 'Porter', 'Davis',
        'Alewife'
      ].freeze

      GREEN_LINE_STATIONS = [
        'Government Center', 'Park Street',
        'Boylston', 'Arlington', 'Copley',
        'Hynes', 'Kenmore'
      ].freeze

      ORANGE_LINE_STATIONS = [
        'North Station', 'Haymarket', 'Park Street',
        'State', 'Downtown Crossing', 'Chinatown',
        'Back Bay', 'Forest Hills'
      ].freeze

      def initialize
        @lines = {
          'Red' => Line.new('Red', RED_LINE_STATIONS),
          'Green' => Line.new('Green', GREEN_LINE_STATIONS),
          'Orange' => Line.new('Orange', ORANGE_LINE_STATIONS)
        }
      end

      def stops_between_stations(line_one, station_start, line_two, station_stop)
        if line_one == line_two
          single_line(line_one, station_start, station_stop)
        else
          multi_line(line_one, station_start, line_two, station_stop)
        end
      end

      def single_line(line, station_start, station_stop)
        start = lines[line].stations.index { |s| s.station_name == station_start }
        stop = lines[line].stations.index { |s| s.station_name == station_stop }

        if start < stop
          stop
        else
          start
        end
      end

      def multi_line(line_one, station_start, line_two, station_stop)
        line_one_stops = distance_to_park_st(line_one, station_start) # 1
        line_two_stops = distance_to_park_st(line_two, station_stop) # 7

        (line_one_stops + line_two_stops) - 1
      end

      def distance_to_park_st(line, line_station)
        start = lines[line].stations.index { |s| s.station_name == line_station }
        park = lines[line].stations.index { |s| s.station_name == 'Park Street' }

        if start < park
          lines[line].stations[start..park].length - 1
        else
          lines[line].stations[park..start].length
        end
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :name, :stations

      def initialize(name, stations)
        @name = name
        @stations = stations.map { |station_name| Station.new(station_name) }
      end
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
