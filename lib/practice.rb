# frozen_string_literal: true
# Even though I got this code to work, I ran into difficulty in simplying trying to print out values like on like 56??
# MBTA in Ruby

class MBTA
  attr_accessor :subway_lines
  attr_accessor :number_of_stops

  def initialize
    # This is a hash where key is the T line and
    # it's value is an array of station names
    @subway_lines = {
      'Red' => [
        'South Station',
        'Park Street',
        'Kendall',
        'Central',
        'Harvard',
        'Porter',
        'Davis',
        'Alewife'
      ],
      'Green' => [
        'Government Center',
        'Park Street',
        'Boylston',
        'Arlington',
        'Copley',
        'Hynes',
        'Kenmore'
      ],
      'Orange' => [
        'North Station',
        'Haymarket',
        'Park Street',
        'State',
        'Downtown Crossing',
        'Chinatown',
        'Back Bay',
        'Forest Hills'
      ]
    }
  end

  def stops_between_stations (start_line, start_station, end_line, end_station)
    @number_of_stops_to_park = 0
    @number_of_stops_from_park = 0

    if start_line == end_line
      @number_stops = subway_lines[start_line].index(start_station) - subway_lines[end_line].index(end_station)
    else
      @number_of_stops_to_park = (subway_lines[start_line].index(start_station) - subway_lines[start_line].index('Park Street')).abs
      @number_of_stops_from_park =  (subway_lines[end_line].index(end_station) - subway_lines[end_line].index('Park Street')).abs
      @number_stops = @number_of_stops_to_park + @number_of_stops_from_park
      # WHY WOULD THIS LINE NOT WORK:
      #puts "Number of stops is: #{number_stops}"
    end # this ends the if statement
    return @number_stops
  end
end #end class

mbta = MBTA.new

# My unit test cases:
# number_of_stops = mbta.stops_between_stations("Red", "Alewife", "Red", "South Station")
# number_of_stops = mbta.stops_between_stations("Red", "Porter", "Orange", "Chinatown")
number_of_stops = mbta.stops_between_stations("Red", "Alewife", "Green", "Kenmore")
# number_of_stops = mbta.stops_between_stations("Orange", "Haymarket", "Green", "Arlington")

#Why wouldn't these work??????
puts number_of_stops
puts @number_of_stops
puts #{number_of_stops}



#Misc Code (Not used):
#puts "\nThe red lines are as follows:\n #{mbta.subway_lines["Red"]}"
#puts "\nThe Porter index stop is: #{mbta.subway_lines["Red"].index("Porter")}"
