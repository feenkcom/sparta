I represent a line.

I am meant to be polymorphic with Rectangle and Path and can be used as path in various operations, except clipping.

Public API and Key Messages

- from get my start point
- to get my end point

  SpartaLine from: 10@10 to: 20@20
 
Internal Representation and Key Implementation Points.

    Instance Variables
	from:		<Point>
	to:		<Point>


    Implementation Points