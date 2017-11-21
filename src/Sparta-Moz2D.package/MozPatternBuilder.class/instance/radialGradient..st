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
		primRadialX: innerCenter x
		Y: innerCenter y
		iR: aRadialGradient innerRadius
		oX: outerCenter x
		Y: outerCenter y
		oR: aRadialGradient outerRadius
		stops: (self primExternalGradientStops: aRadialGradient stops)
		stopsNum: aRadialGradient stops size
		matrix: aRadialGradient transformation asExternalArray getHandle
		extend: aRadialGradient extendMode value) autoRelease