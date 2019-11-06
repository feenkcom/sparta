Extension { #name : #SpartaFontMetrics }

{ #category : #'*Sparta-Moz2D' }
SpartaFontMetrics >> mozInitializeFrom: aMozFontMetrics [
	"Initialize me from external structure"

	fontSize := aMozFontMetrics emHeight.
	
	ascent := aMozFontMetrics maxAscent.
	descent := aMozFontMetrics maxDescent.
	leading := aMozFontMetrics externalLeading.
	
	averageCharWidth := aMozFontMetrics aveCharWidth.
	maxCharacterWidth := aMozFontMetrics maxAdvance.
	capHeight := aMozFontMetrics capHeight.
	xHeight := aMozFontMetrics xHeight.	

	strikeoutOffset := aMozFontMetrics strikeoutOffset.
	strikeoutSize := aMozFontMetrics strikeoutSize.
	underlineOffset := aMozFontMetrics underlineOffset.
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
	
	strikeoutOffset := aSkiaFontMetrics strikeoutPosition.
	strikeoutSize := aSkiaFontMetrics strikeoutThickness.
	underlineOffset := aSkiaFontMetrics underlinePosition.
	underlineSize := aSkiaFontMetrics underlineThickness.
]
