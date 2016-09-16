# A namespace
# module MBTA
#   module Subway
    # All of the subway lines
    class System
      attr_accessor :stops_between_stations, :get_direction, :station_on_same_line, :stops_between, :count_stops, :transfer
      def initialize(lines)
        @subway = lines
      end

      def stops_between_stations(start_station, end_station)
        direction = get_direction(start_station, end_station)
        if station_on_same_line?(start_station, end_station)
          stops_between = count_stops(start_station, end_station)
        else
          transfer(start_station, end_station)
          stops_between = count_stops(start_station, transfer_station)
          stops_between += count_stops(transfer_station, final_station)
        end
        stops_between
      end

      def get_direction(start_station, end_station)
        p subway.lines[0].find_index(start_station)
        p subway.lines[0].find_index(end_station)
      end

      def station_on_same_line(start_station, end_station)
      end

      def stops_between(start_station, end_station)
      end

      def count_stops(start_station, end_station)
      end

      def transfer(start_station, end_station)
      end

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
      attr_reader :name
      def initialize(name)
        @name = name
        @index = index
      end
    end
#   end
# end
