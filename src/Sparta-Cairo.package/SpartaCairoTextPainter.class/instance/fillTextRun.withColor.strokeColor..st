drawing
fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor

	self primSetSourceR: aFillColor red G: aFillColor green B: aFillColor blue A: aFillColor alpha.
	self primSetScaledFont: aTextRun scaledFont.
	self primTranslateX: baseline x Y: baseline y.
	self primShowGlyphs: aTextRun glyphs num: aTextRun glyphs size.
	self primTranslateX: baseline x negated Y: baseline y negated.