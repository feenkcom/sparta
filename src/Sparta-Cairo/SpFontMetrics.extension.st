Extension { #name : #SpFontMetrics }

{ #category : #'*Sparta-Cairo' }
SpFontMetrics >> cairoInitializeFrom: aCairoFontMetrics [
	"Initialize me from external structure"
	
	aveCharWidth := 0.
	capHeight := 0.
	
	emAscent := aCairoFontMetrics ascent.
	emDescent := aCairoFontMetrics descent.
	emHeight := aCairoFontMetrics height.
	maxAdvance := aCairoFontMetrics maxAdvanceX.

	externalLeading := 0.
	internalLeading := 0.
	maxAscent := emAscent.
	maxDescent := emDescent.
	maxHeight := emHeight.
	
	strikeoutOffset := (emAscent / 3.0).
	strikeoutSize := 1.
	underlineOffset := (maxDescent / 2.0) negated.
	underlineSize := 1.

	spaceWidth := 0.
	xHeight := emHeight.
	zeroOrAveCharWidth := 0
]
