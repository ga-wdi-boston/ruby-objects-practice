# debugging code
require_relative './practice'

# instantiate class
my_mbta = MBTA::Subway::System.new
p my_mbta

park_alewife = my_mbta.stops_between_stations('Green', 'Park Street',
                                              'Red', 'Alewife')

haymarket_north = my_mbta.stops_between_stations('Green', 'Haymarket',
                                                 'Orange', 'North Station')

p "Park Street to Alewife (6): #{park_alewife}"
p "Haymarket to North Station (1): #{haymarket_north}"
