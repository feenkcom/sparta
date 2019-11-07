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

{ #category : #'*Sparta-Moz2D' }
SpartaFontMetrics >> skiaInitializeFrom: aSkiaFontMetrics [
	"Initialize me from external structure"
	
	fontSize := aSkiaFontMetrics emHeight.

	ascent := aSkiaFontMetrics ascent.
	descent := aSkiaFontMetrics descent.
	leading := aSkiaFontMetrics leading.
	
	averageCharWidth := aSkiaFontMetrics averageCharWidth.
	maxCharacterWidth := aSkiaFontMetrics maxCharWidth.
	capHeight := aSkiaFontMetrics capHeight.
	xHeight := aSkiaFontMetrics xHeight.
		
	underlineOffset := aSkiaFontMetrics underlinePosition.
	underlineSize := aSkiaFontMetrics underlineThickness.

	strikeoutOffset := aSkiaFontMetrics strikeoutPosition.
	strikeoutSize := aSkiaFontMetrics strikeoutThickness.
	strikeoutSize isZero
		ifTrue: [
			strikeoutOffset := (xHeight / 2.0) negated.
			strikeoutSize := underlineSize ].	

]
