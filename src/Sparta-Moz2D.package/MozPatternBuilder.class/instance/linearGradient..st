accessing
linearGradient: aLinearGradient

	self
		assert: [ aLinearGradient isNotNil ]
		descriptionBlock: [ 'Gradient must not be nil!' ].

	self
		assert: [ aLinearGradient stops isNotNil ]
		descriptionBlock: [ 'Gradient stops must not be nil!' ].

	self
		assert: [ aLinearGradient begin isNotNil ]
		descriptionBlock: [ 'Gradient begin point must not be nil!' ].

	self
		assert: [ aLinearGradient end isNotNil ]
		descriptionBlock: [ 'Gradient end point must not be nil!' ].

	^ (self
		primLinearGradientBeginX: aLinearGradient begin x
		beginY: aLinearGradient begin y
		endX: aLinearGradient end x
		endY: aLinearGradient end y
		rawStops: (self primExternalGradientStops: aLinearGradient stops)
		stopsNum: aLinearGradient stops size
		rawMatrix: aLinearGradient transformation asExternalArray getHandle
		extendMode: aLinearGradient extendMode value) autoRelease