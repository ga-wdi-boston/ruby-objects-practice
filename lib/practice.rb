# A namespace
module MBTA
  module Subway
    # All of the subway lines
    class System
      attr_reader :lines
      def initialize
        @lines = {
          Red:    ['South Station', 'Park Street', 'Kendall', 'Central',
                   'Harvard', 'Porter', 'Davis', 'Alewife'],
          Green:  ['Government Center', 'Park Street', 'Boylston',
                   'Arlington', 'Copley', 'Hynes', 'Kenmore'],
          Orange: ['North Station', 'Haymarket', 'Park Street', 'State',
                   'Downtown Crossing', 'Chinatown', 'Back Bay',
                   'Forest Hills']
                 }
      end

            def stops_between_stations(
              start_line,
              start_station,
              end_line,
              end_station
            )

              start_index = @lines[start_line.to_sym].index(start_station)
              end_index = @lines[end_line.to_sym].index(end_station)
              num_stops = 0

              if start_line == end_line
                num_stops = (end_index - start_index).abs
              else
                first_park_index = @lines[start_line.to_sym]
                                   .index('Park Street')
                first_leg = (first_park_index - start_index).abs
                second_park_index = @lines[end_line.to_sym].index('Park Street')
                second_leg = (end_index - second_park_index).abs

                num_stops = first_leg + second_leg
              end
              num_stops
            end

            def self.stretch
            end
    end
  end
end
