accessing
linearGradient: aLinearGradient
	| aLinearPattern |

	self
		assert: [ aLinearGradient isNotNil ]
		description: [ 'Gradient must not be nil!' ].

	self
		assert: [ aLinearGradient stops isNotNil ]
		description: [ 'Gradient stops must not be nil!' ].

	self
		assert: [ aLinearGradient begin isNotNil ]
		description: [ 'Gradient begin point must not be nil!' ].

	self
		assert: [ aLinearGradient end isNotNil ]
		description: [ 'Gradient end point must not be nil!' ].
	
	aLinearPattern := SpartaCairoLinearGradientPattern
		from: aLinearGradient begin
		to: aLinearGradient end.
		
	aLinearPattern stops: aLinearGradient stops.
	aLinearPattern extend: aLinearGradient extendMode.
	aLinearPattern matrix: aLinearGradient transformation.
	
	^ aLinearPattern