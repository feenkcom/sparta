I provide a factory methods to create common shapes.
Shape factory helps to optimize common shape creation and therefore improve performance 

Public API and Key Messages

- ellipse: to create an ellipse within provided bounds
- circleAt:radius: to create a circle with center at a point and with provided radius
- roundedRectangle:radii: to create a rectangle with rounded corners

	canvas shape ellipse: (0@0 extent: 300@200).
	canvas shape circleAt: 50@50 radius: 25.
	canvas shape roundedRectangle: (0@0 extent: 300@200) radii: (BlCornerRadii radius: 12)
 
Internal Representation and Key Implementation Points.


  	It makes a lot of sense to implement shape creation methods as plugin or as part of backend