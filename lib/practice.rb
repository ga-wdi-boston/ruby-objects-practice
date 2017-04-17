# frozen_string_literal: true
# A namespace

# Red line: 8 stops - South Station, Park Street, Kendall, Central, Harvard, Porter, Davis, Alewife
# Green line: 7 stops - Government Center, Park Street, Boylston, Arlington, Copley, Hynes, Kenmore
# Orange line: 8 stops - North Station, Haymarket, Park Street, State, Downtown Crossing, Chinatown, Back Bay, Forest Hills

# Input from user: start line, start station, end line, end station

module MBTA

  module Subway

    # All of the subway lines
    class System
      attr_reader :start_line, :start_station, :stop_line, :stop_station

      def initialize(start_line, start_station, stop_line, stop_station)
        @start_line = start_line
        @start_station = start_station
        @stop_line = stop_line
        @stop_station = stop_station
      end

    # Subway lines
    subway_lines = {
      :red_line => [
        'South Station',
        'Park Street',
        'Kendall',
        'Central',
        'Harvard',
        'Porter',
        'Davis',
        'Alewife'
      ],
      :green_line => [
        'Government Center',
        'Park Street',
        'Boylston',
        'Arlington',
        'Copley',
        'Hynes',
        'Kenmore'
      ],
      :orange_line => [
        'North Station',
        'Haymarket',
        'Park Street',
        'State',
        'Downtown Crossing',
        'Chinatown',
        'Back Bay',
        'Forest Hills'
      ],
      :intersection => 'Park Street'
    }

      def stops_between_stations
      end

      # return true if the start and stop line are the same
      def is_same_line
        if start_line == stop_line
          return true
        else return false
        end
      end

      # return true if handling multiple intersections
      # def self.stretch
      # end
    end

    # One line, all the stations on that line
    class Line
    end

    # One station
    class Station
    end

  end
end
