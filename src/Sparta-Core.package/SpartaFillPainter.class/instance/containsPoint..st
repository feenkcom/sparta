testing
containsPoint: aPoint
	"Return true if a given point lies within a path as if it would be filled with current fill paint configuration"
	<return: #Boolean>

	path ifNil: [ self error: 'Path must be set before texting if it contains a point' ].

	^ path containsPoint: aPoint