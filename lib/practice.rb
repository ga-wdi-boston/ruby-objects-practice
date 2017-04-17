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
    Subway_lines = {
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
        if is_same_line
          same_line_calc
        else
          intersection_calc
        end
      end

      def my_subway_info
        p "is_same_line is #{is_same_line}"
        p "start is #{@start_line}: #{@start_station}"
        p "last is #{@stop_line}: #{@stop_station}"
        start_num_stops = Subway_lines[:"#{@start_line}"].length
        p "number of stops for start line: #{start_num_stops}"
        last_num_stops = Subway_lines[:"#{@stop_line}"].length
        p "number of stops for start line: #{last_num_stops}"


      end

      # return true if the start and stop line are the same
      def is_same_line
        if @start_line == @stop_line
          true
        else false
        end
      end

      # return true if handling multiple intersections
      # def self.stretch
      # end

      # finds num of stops from start stop to intersection
      # and then finds the num of stops from intersection to last stop
      # for multiple lines scenario
      def intersection_calc
        int_first = (Subway_lines[:"#{@start_line}"].index("Park Street") -
        Subway_lines[:"#{@start_line}"].index("#{@start_station}")).abs
        p "int_first is #{int_first}"
        int_second = (Subway_lines[:"#{@stop_line}"].index("#{@stop_station}") -
        Subway_lines[:"#{@stop_line}"].index("Park Street")).abs
        p "int_second is #{int_second}"
        total_stops = (int_first + int_second).abs
        p "Total number of stops for your trip is: #{total_stops}"
      end

      def same_line_calc
        total_stops = (Subway_lines[:"#{@stop_line}"].index("#{@stop_station}") -
        Subway_lines[:"#{@start_line}"].index("#{@start_station}")).abs
        p "Total number of stops for your trip is: #{total_stops}"
      end

    end
################################

    # One line, all the stations on that line
    class Line
    end

    # One station
    class Station
    end

  end
end
