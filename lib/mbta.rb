require 'practice.rb'
south_station = Station.new('south station')
park_street = Station.new('park street')
kendall = Station.new('kendall')
central = Station.new('central')
harvard = Station.new('harvard')
porter = Station.new('porter')
davis = Station.new('davis')
alewife = Station.new('alewife')

government_center = Station.new('government center')
park_street
boylston = Station.new('boylston')
arlington = Station.new('arlington')
copley = Station.new('copley')
hynes = Station.new('hynes')
kenmore = Station.new('kenmore')

north_station = Station.new('north station')
haymarket = Station.new('haymarket')
park_street
state = Station.new('state')
downtown_crossing = Station.new('downtown crossing')
chinatown = Station.new('chinatown')
back_bay = Station.new('back bay')
ruggles = Station.new('ruggles')
forest_hills = Station.new('forest hills')

red_line = Line.new([south_station, park_street, kendall, central, harvard, porter, davis, alewife])

green_line = Line.new([government_center, park_street, boylston, arlington, copley, hynes, kenmore])

orange_line = Line.new([north_station, haymarket, park_street, state, downtown_crossing, chinatown, back_bay, ruggles, forest_hills])

mbta = System.new([red_line, green_line, orange_line])

mbta.stops_between_stations('south station', 'kendall')
