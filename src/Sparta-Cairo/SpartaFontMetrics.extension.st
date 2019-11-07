Extension { #name : #SpartaFontMetrics }

{ #category : #'*Sparta-Cairo' }
SpartaFontMetrics >> cairoInitializeFrom: aCairoFontMetrics [
	"Initialize me from external structure"
	
	fontSize := aCairoFontMetrics height.
	
	ascent := aCairoFontMetrics ascent negated.
	descent := aCairoFontMetrics descent.
	leading := aCairoFontMetrics height - ascent abs - descent abs.
	
	averageCharWidth := 0.
	maxCharacterWidth := aCairoFontMetrics maxAdvanceX.
	capHeight := 0.
	xHeight := fontSize.
	
	strikeoutOffset := (fontSize / 3.0) negated.
	strikeoutSize := 1.
	underlineOffset := fontSize / 20.
	underlineSize := 1
]
