Class {
	#name : #SpartaCairoPatternBuilder,
	#superclass : #SpartaAbstractBuilder,
	#category : #'Sparta-Cairo-Builders'
}

{ #category : #accessing }
SpartaCairoPatternBuilder >> color: aColor [
	self shouldBeImplemented
]

{ #category : #accessing }
SpartaCairoPatternBuilder >> linearGradient: aLinearGradient [
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
]

{ #category : #accessing }
SpartaCairoPatternBuilder >> radialGradient: aRadialGradient [
	| center aRadialPattern |

	center := aRadialGradient center
		ifNil: [ aRadialGradient radius asPoint ].

	aRadialPattern := SpartaCairoRadialGradientPattern
		innerCenter: center
		innerRadius: 0
		outerCenter: center
		outerRadius: aRadialGradient radius.
		
	aRadialPattern stops: aRadialGradient stops.
	aRadialPattern extend: aRadialGradient extendMode.
	aRadialPattern matrix: aRadialGradient transformation.
	
	^ aRadialPattern
]

{ #category : #accessing }
SpartaCairoPatternBuilder >> surface: aCairoSurfacePaint [
	| aSurfacePattern |
	
	aSurfacePattern := SpartaCairoSurfacePattern surface: aCairoSurfacePaint source.
	^ aSurfacePattern
]
