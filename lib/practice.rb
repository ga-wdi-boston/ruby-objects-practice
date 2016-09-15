# A namespace
# module MBTA
#   module Subway
    # All of the subway lines
    class System
      def initialize(lines)
        @subway = lines
      end

      def stops_between_stations
        direction = get_direction(start_station, end_station)
        if station_on_same_line?(start_station, end_station)
          stops_between = count_stops(start_station, end_station)
        else
          transfer # returns transfer station
          stops_between = count_stops(start_station, transfer_station)
          stops_between += count_stops(transfer_station, final_station)
        end
        stops_between
      end
      
      def get_direction(start_station, end_station)
      end
      
      def station_on_same_line?(start_station, end_station)
      end
      
      def stops_between(start_station, end_station)
      end
      
      def count_stops(start_station, end_station)
      end
      # return true if handling multiple intersections
      def self.stretch
      end
    end
    
    
    # One line, all the stations on that line
    class Line
      def initialize(stations)
        @stations = stations
      end
    end
    # One station
    class Station
      attr_reader :name
      def initialize(name)
        @name = name
      end
    end
#   end
# end
