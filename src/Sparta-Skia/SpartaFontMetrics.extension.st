Extension { #name : 'SpartaFontMetrics' }

{ #category : '*Sparta-Skia' }
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
