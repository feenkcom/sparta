measurement
measure: aSpTextRun in: aSpMetrics
	
	"We measure text only if it is requested"
	aSpMetrics measureText ifTrue: [
		| aTextMetrics |
		aTextMetrics := SpartaCairoTextMetrics new.
		
		"self halt."
		self primSetScaledFont: aSpTextRun scaledFont canvas: aSpMetrics canvas.
		self
			primGlyphExtents: aSpTextRun glyphs
			num: aSpTextRun glyphs size
			metrics: aTextMetrics
			canvas: aSpMetrics canvas.

		aSpMetrics wrappedLength: aSpTextRun glyphs size.
		aSpMetrics textMetrics: aTextMetrics asTextMetrics
	].
	
	"We measure font only if it is requested"
	aSpMetrics measureFont ifTrue: [
		| aFontMetrics |
		aFontMetrics := SpartaCairoFontMetrics new.
		
		self primSetScaledFont: aSpTextRun scaledFont canvas: aSpMetrics canvas.
		self primFontExtents: aFontMetrics canvas: aSpMetrics canvas.
		
		aSpMetrics fontMetrics: aFontMetrics asFontMetrics ]