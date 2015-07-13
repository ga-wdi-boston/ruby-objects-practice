##
# mbta.rb
#
# Author: Charles Li


def calculateStops(startLine, endLine, startStop, endStop)
  redStops = {"south station" => 0, "park st" => 1, "kendall" => 2, "central" => 3, "harvard" => 4, "porter" => 5, "davis" => 6, "alewife" => 7}
  greenStops = {'haymarket'=> 0, 'government center'=> 1, 'park st'=> 2, 'bolyston'=> 3, 'arlington'=> 4, 'copley'=> 5}
  orangeStops = {'north'=> 0, 'haymarket'=> 1, 'park st'=> 2, 'state'=> 3, 'downtown crossing'=> 4, 'chinatown'=> 5, 'back bay'=> 6, 'forest hills'=> 7}

  lines = {'red'=> redStops,
    'green'=> greenStops,
    'orange'=> orangeStops}

    start = lines[startLine][startStop]
    finish = lines[endLine][endStop]
    parkStart = lines[startLine]['park st']
    parkEnd = lines[endLine]['park st']
    return startLine == endLine ? (finish - start).abs : (finish - parkEnd).abs + (start - parkStart).abs
end


def testing()
    puts "****Running Test 1****"
    puts "Inputs: red, red, south station, porter"
    puts "Expected output: 5"
    output = calculateStops('red', 'red', 'south station', 'porter')
    print "Actual output is: ", output, "\n"
    if output == 5
        puts "Test succeeded - output matches expected value"
    else
        puts "Test failed"
    end
    puts
    puts "****Running Test 2****"
    puts "Inputs: red, green, south station, porter"
    puts "Expected output: 4"
    output = calculateStops('red', 'green', 'south station', 'copley')
    print "Actual output is: ", output, "\n"
    if output == 4
        puts "Test succeeded - output matches expected value"
    else
        puts "Test failed"
    end
    puts
    puts "****Running Test 3****"
    puts "Inputs: red, orange, south station, forest hills"
    puts "Expected output: 6"
    output = calculateStops('red', 'orange', 'south station', 'forest hills')
    print "Actual output is: ", output, "\n"
    if output == 6
        puts "Test succeeded - output matches expected value"
    else
        puts "Test failed"
    end
end

testing()
