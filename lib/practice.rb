# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines

      def initialize
        @lines = {
          'Red' => Line.new('South Station', 'Park Street', 'Kendall',
                            'Central', 'Harvard', 'Porter', 'Davis', 'Alewife'),
          'Green' => Line.new('Haymarket', 'Government Center',
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
          @lines[line_a].dist_on_line(station_a, nearest_xfr) +
            @lines[line_b].dist_on_line(station_b, nearest_xfr)
        end
      end

      # Returns the nearest connection point between two lines
      def nearest_xfr # (line_a, station, line_b)
        'Park Street'
        # xfr_stns(line_a, line_b).min_by do |xfr_stn|
        #   dist_on_line(line_a, station, xfr_stn)
        # end
      end

      # # Returns an array of transfers between two lines
      # def xfr_stns(line_a, line_b)
      #   @lines[line(line_a)].select do |stn_i|
      #     xfr?(line_a, stn_i, line_b)
      #   end
      # end
      #
      # # Returns true if station is a transfer point between lines
      # def xfr?(line_a, station, line_b)
      #   @lines[line(line_a)].include?(stn(station)) &&
      #     @lines[line(line_b)].include?(stn(station))
      # end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    class Line
      attr_reader :name, :stns

      def initialize(*stns)
        @stns = stns.map do |stn|
          Station.new(stn)
        end
      end

      # Returns the station's index on the line
      def stop_num(station)
        @stns.index(station)
      end

      # Returns distance between two stops on a line
      def dist_on_line(stn_a, stn_b)
        return nil unless stop_num(stn_a) && stop_num(stn_b)
        (stop_num(stn_a) - stop_num(stn_b)).abs
      end
    end
    # One station
    class Station < String
    end
  end
end
