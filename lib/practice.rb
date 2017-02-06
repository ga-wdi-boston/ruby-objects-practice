# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :red_line
      attr_reader :green_line
      attr_reader :orange_line

      attr_reader :change_lines

      def initialize
        @red_line = Line.new('Red')
        @red_line.create_stops(['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife'])
        @green_line = Line.new('Green')
        @green_line.create_stops(['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore'])
        @orange_line = Line.new('Orange')
        @orange_line.create_stops(['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills'])
      end

      def stops_between_stations(start_line, start_stop,
                                 stop_line, end_stop)
        if start_stop == end_stop
            0 # if they're they same, why do the rest?
        else
          start_stop_line = find_line(start_line) # gives red/green/orange object based on red/green/orange string passed in stops_between_stations parameters
          end_stop_line = find_line(stop_line) # ditto but for end

          @change_lines = !(start_stop_line == end_stop_line) # finds out if on same line

          # if and elsif work together: if start or end is park street, figure out the other stop first to determine which line to use
          if start_stop == "Park Street"
            count_stops(start_stop, end_stop_line, end_stop, end_stop_line) # if we start at park street then we can use the same line as the end line because Park Street is on all lines
          elsif end_stop == "Park Street"
            count_stops(start_stop, start_stop_line, end_stop, start_stop_line)
            # if we end at park street then we can use the same line as the start line because Park Street is on all lines
          else # if anything else, then do normal logic
            count_stops(start_stop, start_stop_line, end_stop, end_stop_line)
          end

        end

      end

      # converts the string to the object we want
      def find_line(stop)
        if stop == "Red"
          @red_line
        elsif stop == "Green"
          @green_line
        else
          @orange_line
        end
      end

      def count_stops(start_stop, start_line, end_stop, end_line)
        if @change_lines
          # count the number of stops between two stations but we will have to change lines
          first_start_stop_index = start_line.stop_index(start_stop)
          first_end_stop_index = start_line.stop_index("Park Street")

          second_start_stop_index = end_line.stop_index(end_stop)
          second_end_stop_index = end_line.stop_index("Park Street")

          return (first_start_stop_index - first_end_stop_index).abs + (second_start_stop_index - second_end_stop_index).abs #distance for first and second lines. The .abs makes sure we have the absolute value of the distance. If we start at index 6 and go to index 5 then we moved -1 stops, which in real life is 1 stop so .abs gives us the absolute value of 1
        else
          # count the number of stops between two stations and we can keep on the same line
          # get the index of start_stop and end_stop on
          # start_line (or end_line because both are the same in this case)
          start_stop_index = start_line.stop_index(start_stop)
          end_stop_index = end_line.stop_index(end_stop)

          stop_count = (start_stop_index - end_stop_index).abs

          return stop_count
        end
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end

    # One line, all the stations on that line
    class Line
      attr_reader :name
      attr_reader :stops

      def initialize(name)
        @name = name
        @stops = []
      end

      def create_stops(stop_names) # sets up the stops into the line array
        stops.push(Station.new(stop_names))
        @stops = stop_names.map { |name| Station.new(name) }
      end

      def has_stop(stop_name) # checks if this line contains the specified stop
        for stop in @stops do
          if stop.name == stop_name
            return true # if the line has a stop, return true
          end
        end

        false # if we never found the stop, its not on this line
      end

      def stop_index(stop) # gives the stop's location in the array
        for stop_number in 0 ... @stops.length
          stop_object = @stops[stop_number]
          if stop_object.name == stop
             return stop_number
          end
        end

        0 # if it can't be found have to return something or it didn't work but since no bad data won't ever be hit
      end

    end

    # One station
    class Station
      attr_reader :name

      def initialize(name) # creates a station with a name
        @name = name
      end
    end
  end
end
