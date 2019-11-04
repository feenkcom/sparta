Class {
	#name : #SkiaFontExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaFontExamples >> default [
	<gtExample>
	| aFont |
	
	aFont := SkiaFont new.
	self assert: aFont edging equals: SkiaFontEdging AntiAlias.
	self assert: aFont hinting equals: SkiaFontHinting Normal.
	self assert: aFont lineSpacing equals: 12.0.
	self assert: aFont isBaselineSnap.
	self assert: aFont isEmbeddedBitmaps not.
	self assert: aFont isEmbolden not.
	self assert: aFont isForceAutoHinting not.
	self assert: aFont isLinearMetrics not.
	self assert: aFont isSubpixel not.
	
	^ aFont
]

{ #category : #accessing }
SkiaFontExamples >> measureHelloWorld [
	<gtExample>
	| aFont aPaint theMeasurement |
	
	aFont := self default.
	aPaint := SkiaPaint new color: Color black.
	theMeasurement := aFont measureString: 'Hello' paint: aPaint.
	
	self assert: theMeasurement first > 0.
	self assert: theMeasurement second hasPositiveExtent.
	
	^ theMeasurement
]

{ #category : #accessing }
SkiaFontExamples >> toGlyphsHelloWorld [
	<gtExample>
	| aFont theGlyphs |
	
	aFont := self default.
	theGlyphs := (aFont stringToGlyphs: 'Hello') asArray.
	
	self assert: theGlyphs equals: #(43 72 79 79 82).

	^ theGlyphs
]
