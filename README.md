![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# MBTA Lab

## Objectives:
- Practice with array operations, intersections, etc., and working with arrays as values of a hash

## Activity:

- Create a method or methods that models a simple subway system.
- The method takes the line and stop that a user is getting on at and the line and stop that user is getting off at and return the total number of stops for that trip.
- There are 3 subway lines:
  - The Red line has the following stops: "south station", "park st", "kendall", "central", "harvard", "porter", "davis", "alewife"
  - The Green line has the following stops: "haymarket", "government center", "park st", "bolyston", "arlington", "copley"
  - The Orange line has the following stops:  "north station", "haymarket", "park st", "state", "downtown crossing", "chinatown", "back bay", "forest hills"
  - All 3 subway lines intersect at "park st", but there are no other intersection points. Some of this MBTA is fictionalized - for instance, in this example, Haymarket _does not_ connect the orange and green lines.
- Demonstrate your methods by calling them from the end of the script and printing the input and return values
- Submit your solution to this lab via a pull request.

### Hints:

* Write any methods as 'functionally' as possible (i.e. minimizing 'side effects'). Separate your input, output and calculation. Attempt to not overwrite variables when possible. Feel free to write *many* methods.
* Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
* Make subway lines keys in a hash, while the values are an array of all the stops on each line.
* The key is the intersection of the lines at "park st".
