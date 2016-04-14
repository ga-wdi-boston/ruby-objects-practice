![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# MBTA practice

## To start

Fork, clone, branch (practice) and npm install

## Objectives

-   Practice with classes, methods, and collections.
-   You may submit a pull request for this practice, but it is not required.

## Activity

-   Create a class in `lib/practice.rb` with a method `stops_between_stations`
to calculate the number of stops between stations on the "MBTA".
Write additional classes and or methods as needed.
-   The method takes the line and stop name that a rider is getting on at and
 the line and stop name that a rider is getting off at and **returns the total
  number of stops for the trip**.
-   When `MBTA::Subway::System.new` is called, its initialize method should
 store all the information needed by `stops_between_stations`.

There are 3 subway lines:

-   The Red line has the following stops: South Station, Park Street, Kendall,
 Central, Harvard, Porter, Davis, Alewife
-   The Green line has the following stops: Government Center, Park Street,
 Boylston, Arlington, Copley, Hynes, Kenmore
-   The Orange line has the following stops:  North Station, Haymarket,
Park Street, State, Downtown Crossing, Chinatown, Back Bay, Forest Hills
-   All 3 subway lines intersect at *Park Street*, but there are no other
 intersection points. Some of this MBTA is fictionalized.

## Checking your solution

Run `rake test`.

## Hints

-   Assume good input.  Your function need not check the validity of the line or
 stop name.
-   Consider diagramming the lines by sketching out the subway lines and their
 stops and intersection.
-   The key to the practice is to find the **intersection** of the lines at
 *Park Street*.
-   Solve an easier problem first.

## Bonus

Think about adding Haymarket before Government Center on the Green line then try
 to find a solution when there are multiple intersections.
Is there a way to decide if a particular solution is "correct"?

This bonus is completely optional and does not have tests, yet.

## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
