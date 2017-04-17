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
        # if is_same_line
        #
        # end
      end

      def my_subway_info
        p "start is #{@start_line}: #{@start_station}"
        p "end is #{@stop_line}: #{@stop_station}"
        num_stops = Subway_lines[:"#{@start_line}"].length
        p "number of stops for this line: #{num_stops}"

        first_stop_pos = Subway_lines[:"#{@start_line}"].index("#{@start_station}")
        p "first stop is @ #{first_stop_pos}"

        last_stop_pos = Subway_lines[:"#{@stop_line}"].index("#{@stop_station}")
        p "last stop is @ #{last_stop_pos}"
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

      # finds number of station stops from start of line to intersection
      # this is for start/stop lines that are not the same
      def intersection_calc
        int_first = Subway_lines[:"#{@start_line}"].index("Park Street") - Subway_lines[:"#{@start_line}"].index("#{@start_station}")
        int_second = Subway_lines[:"#{@stop_line}"].index("#{@stop_station}") - Subway_lines[:"#{@stop_line}"].index("Park Street")
        total_stops = int_first + int_second
      end

      # finds number of station stops from intersection to end of line
      # this is for start/stop lines that are not the same
      def int_to_end
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
