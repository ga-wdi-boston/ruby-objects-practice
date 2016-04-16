# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines

      def initialize
        @lines = {
          'Red' => Line.new('Red', 'South Station', 'Park Street',
                            'Kendall', 'Central', 'Harvard', 'Porter',
                            'Davis', 'Alewife'),
          'Green' => Line.new('Green', 'Haymarket', 'Government Center',
                              'Park Street', 'Boylston', 'Arlington',
                              'Copley', 'Hynes', 'Kenmore'),
          'Orange' => Line.new('Orange', 'North Station', 'Haymarket',
                               'Park Street', 'State',
                               'Downtown Crossing', 'Chinatown',
                               'Back Bay', 'Forest Hills')
        }
      end

      def stops_between_stations(line_a, station_a, line_b, station_b)
        if line_a == line_b
          @lines[line_a].dist_on_line(station_a, station_b)
        else
          @lines[line_a].xfr_stns(@lines[line_b]).map do |xfr_stn|
            route_len_w_xfr(line_a, station_a, xfr_stn, line_b, station_b)
          end.min
        end
      end

      # Returns length of a route between two lines with a given transfer point
      def route_len_w_xfr(line_a, station_a, xfr_stn, line_b, station_b)
        @lines[line_a].dist_on_line(station_a, xfr_stn) +
          @lines[line_b].dist_on_line(xfr_stn, station_b)
      end

      # return true if handling multiple intersections
      def self.stretch
        true
      end
    end
    # One line, all the stations on that line
    class Line < Array
      attr_reader :name

      def initialize(name, *stns)
        super(0)
        @name = name
        replace(stns.map do |stn|
          Station.new(stn)
        end)
      end

      # Returns the station's index on the line
      def stop_num(station)
        index(station)
      end

      # Returns distance between two stops on a line
      def dist_on_line(stn_a, stn_b)
        return nil unless stop_num(stn_a) && stop_num(stn_b)
        (stop_num(stn_a) - stop_num(stn_b)).abs
      end

      # Returns true if station is a transfer point to the passed line
      def xfr?(station, other_line)
        other_line.include?(station)
      end

      # Returns an array of transfers to the other line
      def xfr_stns(other_line)
        select do |stn_i|
          xfr?(stn_i, other_line)
        end
      end
    end
    # One station
    class Station < String
    end
  end
end
