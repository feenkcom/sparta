testing
containsPoint: aPoint
	"Return true if a given point lies within a path as if it would be stroked with current stroke paint configuration"
	<return: #Boolean>
	
	path ifNil: [ self error: 'Path must be set before texting if it contains a point' ].

	^ path strokeContainsPoint: aPoint options: self strokeOptions on: self canvas