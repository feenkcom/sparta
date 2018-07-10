initialization
from: aFromPoint to: aToPoint
	self
		assert: [ from isNil and: [ to isNil ] ]
		description: [ 'Path is immutable and can not be changed' ].

	from := aFromPoint.
	to := aToPoint