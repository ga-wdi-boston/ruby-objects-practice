mbta = {
  :red_line => ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife'],
  :green_line => ['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore'],
  :orange_line => ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
}


def stops_between_stations(mbta, start_line, start_station, end_line, end_station)
  number_of_stops = 0
  if start_line == end_line
    number_of_stops = (mbta[start_line].index(start_station) - mbta[end_line].index(end_station)).abs
    return number_of_stops

  else
    number_of_stops_to_park = (mbta[start_line].index(start_station) - mbta[start_line].index('Park Street')).abs
    number_of_stops_from_park = (mbta[end_line].index('Park Street') - mbta[end_line].index(end_station)).abs
    total_stops = number_of_stops_from_park + number_of_stops_to_park
    return total_stops
  end

end

puts stops_between_stations(mbta, :red_line, 'South Station',:red_line, 'Central')
puts stops_between_stations(mbta, :red_line, 'South Station',:green_line, 'Arlington')



# # A namespace
# module MBTA
#   module Subway
#     # All of the subway lines
#     class System
#       def initialize(start_line, start_station, end_line, end_station)
#         @start_line = start_line
#         @start_station = start_station
#         @end_line = end_line
#         @end_station = end_station
#
#         @mbta = {
#           :red_line => ['South Station', 'Park Street', 'Kendall', 'Central', 'Harvard', 'Porter', 'Davis', 'Alewife'],
#           :green_line => ['Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley', 'Hynes', 'Kenmore'],
#           :orange_line => ['North Station', 'Haymarket', 'Park Street', 'State', 'Downtown Crossing', 'Chinatown', 'Back Bay', 'Forest Hills']
#         }
#       end
#
#       def stops_between_stations(mbta, start_line, start_station, end_line, end_station)
#           number_of_stops = 0
#           if start_line == end_line
#             number_of_stops = (mbta[start_line].index(start_station) - mbta[end_line].index(end_station)).abs
#             return number_of_stops
#
#           else
#             number_of_stops_to_park = (mbta[start_line].index(start_station) - mbta[start_line].index('Park Street')).abs
#             number_of_stops_from_park = (mbta[end_line].index('Park Street') - mbta[end_line].index(end_station)).abs
#             total_stops = number_of_stops_from_park + number_of_stops_to_park
#             return total_stops
#       end
#
#       # return true if handling multiple intersections
#       def self.stretch
#         if start_station == end_station
#           return true
#       end
#     end
#     # One line, all the stations on that line
#     class Line
#     end
#     # One station
#     class Station
#     end
#   end
# end
#
# test = MBTA::Subway::System.new
