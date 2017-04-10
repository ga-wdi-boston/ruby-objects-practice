[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# MBTA practice

## To start

Fork, clone, branch (practice) and bundle install

## Objectives

-   Practice with classes, methods, and collections.
-   You should submit a pull request for this practice, but it is not required.

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

Run `bin/rake test`.

## Hints

-   Assume good input.  Your function need not check the validity of the line or
    stop name.
-   Think about where to store initialization data.
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

## Tasks

Developers should run these often!

-   `bin/rake nag`  (or `bundle exec rake nag`):
    runs code quality analysis tools on your code and complains.
-   `bin/rake test` (or `bundle exec rake test`): runs automated tests.
-   `bin/rake` will run both `nag` and `test`

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
