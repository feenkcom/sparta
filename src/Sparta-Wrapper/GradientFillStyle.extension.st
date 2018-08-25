Extension { #name : #GradientFillStyle }

{ #category : #'*Sparta-Wrapper' }
GradientFillStyle >> asSpartaPaintOn: aSpartaCanvas [
	
	^ self radial ifTrue: [
		aSpartaCanvas paint radialGradient
			stops: self colorRamp;
			outerCenter: (aSpartaCanvas transform current inverseTransform: self origin);
			outerRadius: self direction y ]
	ifFalse: [
		aSpartaCanvas paint linearGradient
			stops: self colorRamp;
			begin: (aSpartaCanvas transform current inverseTransform: self origin);
			end: (aSpartaCanvas transform current inverseTransform: self origin + self direction) ]
]
