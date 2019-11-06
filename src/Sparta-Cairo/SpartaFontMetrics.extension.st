Extension { #name : #SpartaFontMetrics }

{ #category : #'*Sparta-Cairo' }
SpartaFontMetrics >> cairoInitializeFrom: aCairoFontMetrics [
	"Initialize me from external structure"
	
	fontSize := aCairoFontMetrics height.
	
	ascent := aCairoFontMetrics ascent.
	descent := aCairoFontMetrics descent.
	leading := aCairoFontMetrics height - ascent abs - descent abs.
	
	averageCharWidth := 0.
	maxCharacterWidth := aCairoFontMetrics maxAdvanceX.
	capHeight := 0.
	xHeight := fontSize.
	
	strikeoutOffset := (ascent / 3.0).
	strikeoutSize := 1.
	underlineOffset := (ascent / 2.0) negated.
	underlineSize := 1
]
