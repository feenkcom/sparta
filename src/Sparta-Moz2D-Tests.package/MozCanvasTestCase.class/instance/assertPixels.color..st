asserting
assertPixels: aRectangle color: aColor

	self
		assert: (self form copy: aRectangle)
		equals: ((MozTestComparableForm extent: aRectangle extent depth: 32) fillColor: aColor)