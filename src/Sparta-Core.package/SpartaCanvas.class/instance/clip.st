api
clip
	"Perform a clipping.
	User gets a clipper object responsible for clipping.
	See !SpartaClipper 'clipping' protocol for available api.

	canvas clip
		by: (0@0 extent: 300@350)
		during: [ 'perform drawing operations here' ].
	
	or:

	canvas clip
		push: (0@0 extent: 300@350).

	'perform drawing operations here'

	canvas clip
		pop.
	"
	<return: #SpartaClipper>

	^ self clipBuilder
		reset;
		canvas: self;
		yourself