#Title: MBTA Lab

## Objectives:
- Practice with array operations, intersections, etc., and working with arrays as values of a hash

## Activity:

- Create a method or methods that models a simple subway system.
- The method takes the line and stop that a user is getting on at and the line and stop that user is getting off at and return the total number of stops for that trip.
- There are 3 subway lines:
  - The Red line has the following stops: south station, park st, kendall, central, harvard, porter, davis, alewife
  - The Green line has the following stops: haymarket, government center, park st, bolyston, arlington, copley
  - The Orange line has the following stops:  north station, haymarket, park st, state, downtown crossing, chinatown, back bay, forest hills
  - All 3 subway lines intersect at *park st*, but there are no other intersection points. Some of this MBTA is fictionalized. Haymarket does not connect the orange/green lines.
- Demonstrate your methods by calling them from the end of the script and printing the input and return values
- Do a Pull Request to turn in your homework

### Hints:

* Write all methods as functionally as possible. Separate your input, output and calculation. Attempt to not overwrite variables when possible. Write *many* methods.
* Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
* Make subway lines keys in a hash, while the values are an array of all the stops on each line.
* The key to the lab is to find the __intersection__ of the lines at *park st*.
