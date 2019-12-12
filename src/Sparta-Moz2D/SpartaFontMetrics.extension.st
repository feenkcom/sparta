Extension { #name : #SpartaFontMetrics }

{ #category : #'*Sparta-Moz2D' }
SpartaFontMetrics >> mozInitializeFrom: aMozFontMetrics [
	"Initialize me from external structure"

	fontSize := aMozFontMetrics emHeight.
	
	ascent := aMozFontMetrics emAscent negated.
	descent := aMozFontMetrics emDescent.
	leading := aMozFontMetrics externalLeading.
	
	averageCharWidth := aMozFontMetrics aveCharWidth.
	maxCharacterWidth := aMozFontMetrics maxAdvance.
	capHeight := aMozFontMetrics capHeight.
	xHeight := aMozFontMetrics xHeight.	

	strikeoutOffset := aMozFontMetrics strikeoutOffset negated.
	strikeoutSize := aMozFontMetrics strikeoutSize.
	underlineOffset := aMozFontMetrics underlineOffset negated.
	underlineSize := aMozFontMetrics underlineSize.
]
