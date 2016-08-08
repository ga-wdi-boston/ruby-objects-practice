# # A namespace
# module MBTA
  # module Subway
    # All of the subway lines



    class System
      @@subway = []
      attr_accessor :subway_lines
      attr_reader :city

      def initialize(city)
        @city = city
        @subway_lines = []
        @@subway<<self
      end

      def stops_between_stations(start_line,start_station,end_line,end_station)
        start_position = subway_lines.select { |line| line.color == start_line }[0].stations.select { |stops| stops.station== start_station}[0].position
        park_from_start = subway_lines.select { |line| line.color == start_line}[0].stations.select { |stops| stops.station=='Park Street'}[0].position
        start_distance = (start_position - park_from_start).abs
        end_position = subway_lines.select { |line| line.color == end_line }[0].stations.select { |stops| stops.station== end_station}[0].position
        park_from_end = subway_lines.select { |line| line.color == end_line}[0].stations.select { |stops| stops.station=='Park Street'}[0].position
        end_distance = (end_position - park_from_end).abs
        total_distance = start_distance + end_distance

        p "The total stops between #{start_station} and #{end_station} stations is #{total_distance} stops"

      end

      # return true if handling multiple intersections
      def self.stretch
       p  @@subway
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

red_line = Line.new("red")
mbta.subway_lines<<red_line
red_line.stations<<Station.new(position:0,station:"South Station")
red_line.stations<<Station.new(position:1,station:"Park Street")
red_line.stations<<Station.new(position:2,station:"Kendall")
red_line.stations<<Station.new(position:3,station:"Central")
red_line.stations<<Station.new(position:4,station:"Harvard")
red_line.stations<<Station.new(position:5,station:"Porter")
red_line.stations<<Station.new(position:6,station:"Davis")
red_line.stations<<Station.new(position:7,station:"Alewife")

green_line = Line.new("green")
mbta.subway_lines<<green_line
green_line.stations<<Station.new(position:0,station:"Government Center")
green_line.stations<<Station.new(position:1,station:"Park Street")
green_line.stations<<Station.new(position:2,station:"Boylston")
green_line.stations<<Station.new(position:3,station:"Arlington")
green_line.stations<<Station.new(position:4,station:"Copley")
green_line.stations<<Station.new(position:5,station:"Hynes")
green_line.stations<<Station.new(position:6,station:"Kenmore")

orange_line = Line.new("orange")
mbta.subway_lines<<orange_line
orange_line.stations<<Station.new(position:0,station:"North Station")
orange_line.stations<<Station.new(position:1,station:"Haymarket")
orange_line.stations<<Station.new(position:2,station:"Park Street")
orange_line.stations<<Station.new(position:3,station:"State")
orange_line.stations<<Station.new(position:4,station:"Downtown Crossing")
orange_line.stations<<Station.new(position:5,station:"Chinatown")
orange_line.stations<<Station.new(position:6,station:"Back Bay")
orange_line.stations<<Station.new(position:7,station:"Forest Hills")

mbta.stops_between_stations('red','Central','green','Copley')


# mbta.subway_lines.select { |line| line.color == "red"}[0].stations.select { |stops| stops.station=='Central'}[0].position
