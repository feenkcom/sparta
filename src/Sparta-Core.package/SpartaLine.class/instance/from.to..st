initialization
from: aFromPoint to: aToPoint
	self
		assert: [ aFromPoint isNil and: [ aToPoint isNil ] ]
		description: [ 'Path is immutable and can not be changed' ].

	from := aFromPoint.
	to := aToPoint