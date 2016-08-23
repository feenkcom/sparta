accessing
radialGradient: aRadialGradient
	| innerCenter outerCenter |
	innerCenter := aRadialGradient innerCenter.
	outerCenter := aRadialGradient outerCenter.
	
	(innerCenter isNil and: [ outerCenter isNil ]) ifTrue: [ 
		innerCenter := ((aRadialGradient innerRadius + aRadialGradient outerRadius) / 2.0) asPoint ].
	
	innerCenter ifNil: [ innerCenter := outerCenter ].
	outerCenter ifNil: [ outerCenter := innerCenter ].

	^ (self
		primRadialGradientInnerCenterX: innerCenter x
		innerCenterY: innerCenter y
		innerRadius: aRadialGradient innerRadius
		outerCenterX: outerCenter x
		outerCenterY: outerCenter y
		outerRadius: aRadialGradient outerRadius
		rawStops: (self primExternalGradientStops: aRadialGradient stops)
		stopsNum: aRadialGradient stops size
		rawMatrix: aRadialGradient transformation asExternalArray getHandle
		extendMode: aRadialGradient extendMode value) autoRelease