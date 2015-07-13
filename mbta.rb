# Your code goes here

require 'pry'


def stops_between (start_line, start_station, stop_line, stop_station)
  mbta = {
    "red" => [
      'south station',
      'park st',
      'kendall',
      'central',
      'harvard',
      'porter',
      'davis',
      'alewife'],
    "green" => [
      'haymarket',
      'government center',
      'park st',
      'boylston',
      'arlington',
      'copley'],
    "orange" => [
      'north station',
      'haymarket',
      'park st',
      'state',
      'downtown crossing',
      'chinatown',
      'back bay',
      'forest hills']
  }

  if start_line == stop_line
    total_stops = (mbta[start_line].index(start_station) - mbta[start_line].index(stop_station)).abs
    puts total_stops
  else
    stops_2_park = (mbta[start_line].index(start_station) - mbta[start_line].index('park st')).abs
    stops_from_park = (mbta[stop_line].index('park st') - mbta[stop_line].index(stop_station)).abs
    total_stops = stops_2_park + stops_from_park
    puts total_stops
  end
  return total_stops
end


binding.pry
""
