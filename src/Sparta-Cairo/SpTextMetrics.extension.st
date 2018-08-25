Extension { #name : #SpTextMetrics }

{ #category : #'*Sparta-Cairo' }
SpTextMetrics >> cairoInitializeFrom: aCairoTextMetrics [
	"Initialize me from external structure"

	advance := aCairoTextMetrics advanceX.

	left := aCairoTextMetrics bearingX.
	top := aCairoTextMetrics bearingY.
	width := aCairoTextMetrics width.
	height := aCairoTextMetrics height.
	
	ascent := top negated.
	descent := (top + width) negated
]
