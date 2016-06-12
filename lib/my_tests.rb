# debugging code
require_relative './practice'

# instantiate class
my_mbta = MBTA::Subway::System.new
p my_mbta

distance_one = my_mbta.stops_between_stations('Green', 'Park Street',
                                              'Red', 'Alewife')

p "Park Street to Alewife (6): #{distance_one}"
