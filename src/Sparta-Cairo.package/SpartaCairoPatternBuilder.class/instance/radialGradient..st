accessing
radialGradient: aRadialGradient
	| innerCenter outerCenter aRadialPattern |

	innerCenter := aRadialGradient innerCenter.
	outerCenter := aRadialGradient outerCenter.
	
	(innerCenter isNil and: [ outerCenter isNil ]) ifTrue: [ 
		innerCenter := ((aRadialGradient innerRadius + aRadialGradient outerRadius) / 2.0) asPoint ].
	
	innerCenter ifNil: [ innerCenter := outerCenter ].
	outerCenter ifNil: [ outerCenter := innerCenter ].
	
	aRadialPattern := SpartaCairoRadialGradientPattern
		innerCenter: innerCenter
		innerRadius: aRadialGradient innerRadius
		outerCenter: outerCenter
		outerRadius: aRadialGradient outerRadius.
		
	aRadialPattern stops: aRadialGradient stops.
	aRadialPattern extend: aRadialGradient extendMode.
	aRadialPattern matrix: aRadialGradient transformation.
	
	^ aRadialPattern