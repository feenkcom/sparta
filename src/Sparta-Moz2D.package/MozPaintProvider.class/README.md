I provide users with backend specific paints.

Public API and Key Messages

- color: - to create a color paint from Color, provided paint is ready to use
- linearGradient - to initialize a linear gradient object that should be configured correctly by user
- radialGradient - to create a radial gradient  object that should be configured correctly by user

	 canvas paint color: Color red

	canvas paint linearGradient
		begin: 0@0;
		end: 300@300;
		stops: { 0 -> Color red. 1 -> Color blue }

	canvas paint radialGradient
		innerCenter: 150@150;
		outerRadius: 100;
		reflect;
		stops: { 0 -> Color red. 1 -> Color blue }
 
Internal Representation and Key Implementation Points.

	I am stateless and can be easily reused