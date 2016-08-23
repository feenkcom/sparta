*Sparta-Moz2D
mozFromFreetypeFace: aFace
	| handle cairoFace |
	
	handle := aFace handle nbUlongAt: 1.
	cairoFace := MozCanvas primCreateCairoFontFace: handle loadFlags: ( LoadNoHinting | LoadTargetLCD | LoadNoAutohint | LoadNoBitmap). 
	
	^ cairoFace initializeWithFreetypeFace: aFace