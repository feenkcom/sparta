"
! TSpartaGradientPaint

I define an API of an abstract gradient paint. All gradient paints should use me and implement all my methods.

!! Overview

I am responsible for setting of gradient stops. Since I just define an abstract api, my implementors should provide concrete logic.

Like any other paint I must not be instantiated by onyone except *canvas>../SpartaCanvas.class/README.md*.

!! Public API and Key Messages

- ==stops:== set gradient stops encoded as an array of associations {Number -> Color}

"
Trait {
	#name : #TSpartaGradientPaint,
	#category : 'Sparta-Core-Paints'
}

{ #category : #accessing }
TSpartaGradientPaint >> stops: anArrayOfStops [
	^ self explicitRequirement
]
