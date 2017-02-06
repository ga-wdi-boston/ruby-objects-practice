# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      @@trip = []

      def initialize (start_station:, start_line:, stop_station:, stop_line:)
        @start_station = start_station
        @start_line = start_line
        @stop_station = stop_station
        @stop_line = stop_line

        @@trip << self
      end

      def stops_between_stations
        puts (Station.start_index - Station.park_start_index).abs + (Station.stop_index - Station.park_stop_index).abs
      end
      # return true if handling multiple intersections
      # def self.stretch
      # end
    end

    # One line, all the stations on that line
    class Line
      def initialize (start_line:, stop_line:)
        @start_line
        @stop_line
        @red_line = ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']
        @green_line = ['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore']
        @orange_line = ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
      end

      def set_start_line_array
        if @start_line == "Red"
          @start_line << @red_line
        elsif @start_line == "Green"
          @start_line << @green_line
        else
          @start_line << @orange_line
        end
      end

        def set_stop_line_array
          if @stop_line == "Red"
            @stop_line << @red_line
          elsif @stop_line == "Green"
            @stop_line << @green_line
          else
            @stop_line << @orange_line
          end
        end
    end

    # One station
    class Station
      #setters
      def initialize (start_station:, stop_station:)
        @start_station= start_station
        @stop_station= stop_station
        @start_index
        @stop_index
        @park_start_index
        @park_stop_index
      end

      def set_start_index
        @start_index = @start_line.index(@start_station)
      end

      def set_stop_index
        @stop_index = @stop_line.index(@stop_station)
      end

      def set_start_park_index
        @park_start_index = @start_line.index('Park Street')
      end

      def set_stop_park_index
        @park_stop_index = @stop_line.index('Park Street')
      end
    end
      end
    end

require 'pry'
''
