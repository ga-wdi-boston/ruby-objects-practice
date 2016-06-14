# # A namespace
# module MBTA
  # module Subway
    # All of the subway lines



    class System
      @@subway = []

      def initialize(city)
        @city = city
        @lines = []
        @@subway<<self
      end

      def stops_between_stations(start_line,start_station,end_line,end_station)

      end

      # return true if handling multiple intersections
      def self.stretch
      end
    end

    # One line, all the stations on that line
    class Line
      attr_reader :color
      attr_accessor :stations
      @@lines=[]
      def initialize(color)
        @color= color
        @stations = []
        @@lines<<self
      end
      def self.all
        @@lines
      end
    end


    # One station
    class Station
      attr_reader :station, :position
      def initialize(position:,station:)
        @position = position
        @station = station
      end
    end

#   end
# end


mbta = System.new("Boston")

red_line = Line.new("Red")
red_line.stations<<Station.new(position:0,station:"South Station")
red_line.stations<<Station.new(position:1,station:"Park Street")
red_line.stations<<Station.new(position:2,station:"Kendall")
red_line.stations<<Station.new(position:3,station:"Central")
red_line.stations<<Station.new(position:4,station:"Harvard")
red_line.stations<<Station.new(position:5,station:"Porter")
red_line.stations<<Station.new(position:6,station:"Davis")
red_line.stations<<Station.new(position:7,station:"Alewife")

green_line = Line.new("Green")
green_line.stations<<Station.new(position:0,station:"Government Center")
green_line.stations<<Station.new(position:1,station:"Park Street")
green_line.stations<<Station.new(position:2,station:"Boylston")
green_line.stations<<Station.new(position:3,station:"Arlington")
green_line.stations<<Station.new(position:4,station:"Copley")
green_line.stations<<Station.new(position:5,station:"Hynes")
green_line.stations<<Station.new(position:6,station:"Kenmore")

orange_line = Line.new("Orange")
orange_line.stations<<Station.new(position:0,station:"North Station")
orange_line.stations<<Station.new(position:1,station:"Haymarket")
orange_line.stations<<Station.new(position:2,station:"Park Street")
orange_line.stations<<Station.new(position:3,station:"State")
orange_line.stations<<Station.new(position:4,station:"Downtown Crossing")
orange_line.stations<<Station.new(position:5,station:"Chinatown")
orange_line.stations<<Station.new(position:6,station:"Back Bay")
orange_line.stations<<Station.new(position:7,station:"Forest Hills")


start_station = red_line.stations.select { |stops| stops.station=='Central'}[0].position
p start_station
# p orange_line
# p green_line
