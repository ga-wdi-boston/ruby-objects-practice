# Disclaimer: I tried every step on my own and then referenced the solution branch after 5-10 minutes if I couldn't solve an issue on my own.
require 'pry'
# frozen_string_literal: true
# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      # step1: create hashes for the subway lines with their stops in them
      def initialize
        @lines = {
          'Red' => Line.new('Red', ['South Station', 'Park Street', 'Kendall',
            'Central', 'Harvard', 'Porter', 'Davis', 'Alewife']),
          'Green' => Line.new('Green', ['Haymarket', 'Government Center',
            'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes',
            'Kenmore']),
          'Orange' => Line.new('Orange', ['North Station', 'Haymarket',
            'Park Street', 'State', 'Downtown Crossing', 'Chinatown',
            'Back Bay', 'Forest Hills'])
        }
      end

      #step2: Next, we have to create a method that counts our stops
      #it will have to take in 3 paramters: the line we are starting on, the
      #first stop and the second stop.
      def stop_counter(line, station1, station2)
        #we need a counter for the number of stops between the two station
        #arguments.
        stops = line.stations

        #we're going to solve this problem by counting the difference in index
        #values between two stops, so we want to get the index value accounted
        #for one stop at a time through iteration:
        station1_index = stops.index { |s| s.name == station1}
        station2_index = stops.index { |s| s.name == station2}
        #we want to make sure we are logging in the right direction as we are calculating the index
        real_stop = if station1_index <= station2_index
        # we will log the names of all the stops beginning and ending at the two stations. This synatx is new to me and something I will have to try to keep in mind.
          stops[station1_index..station2_index]
        else
          stops[station2_index..station1_index]
        end
        #we take the length of our real_stops array and subtract 1 because we do not count our starting point as a stop travelled.
        real_stop.length - 1
      end

#we are going to calculate between the starting station and line and the ending
#station and line.
      def stops_between_stations(start_line, start_station,
        end_line, end_station)
    #first, we want to take care of the easier situation of whther or not we are dealing with the two stops being on the same line. If they are, we can just use the stop_counter function
        if start_line == end_line
          stop_counter(@lines[start_line], start_station, end_station)
        else
    # then we apply the count_stops function to the first line up to park street, where the transfer takes place,
          num_stop1 = stop_counter(@lines[start_line], start_station, 'Park Street')
    #then for the second stop, we take in the number of stops on the line from Park Street
          num_stop2 = stop_counter(@lines[end_line], 'Park Street', end_station)
    # we add those two numbers together
          num_stops = num_stop1 + num_stop2
    # we return that number
          num_stops
        end
      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end
    # One line, all the stations on that line
    #When we made our new lines, we were making hash instances of this new class and we want access to the stations and their names, but we will not be changing them, so just a getter will be fine
    class Line
      attr_reader :stations
      attr_reader :name
#We need to account for
      def initialize(name, stations)
        @name = name
    #We are giving a name to each station
        @stations = stations.map { |station_name| Station.new(station_name) }
      end
    end
    # One station
    #We are also going to need to need a getter for each individual station as well
    class Station
      attr_reader :name
        def initialize(name)
          @name = name
    end
  end
end
end
