Class {
	#name : #SkiaFontExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaFontExamples >> default [
	<gtExample>
	<return: #AssertionFailure>
	| aFont |
	aFont := SkiaFont new.
	self assert: aFont edging equals: SkiaFontEdging AntiAlias.
	self assert: aFont hinting equals: SkiaFontHinting Normal.
	self assert: aFont lineSpacing > 0.
	self assert: aFont isBaselineSnap.
	self assert: aFont isEmbeddedBitmaps not.
	self assert: aFont isEmbolden not.
	self assert: aFont isForceAutoHinting not.
	self assert: aFont isLinearMetrics not.
	self assert: aFont isSubpixel not.
	self assert: aFont scale equals: 1.0.
	self assert: aFont size equals: 12.0.
	self assert: aFont skew equals: 0.0.

	^ aFont
]

{ #category : #accessing }
SkiaFontExamples >> fontMetrics [
	<gtExample>
	<return: #AssertionFailure>
	| aFont aFontMetrics |
	aFont := self default.
	aFontMetrics := aFont metrics.	"Return the recommended spacing between lines: the sum of metrics descent, ascent, and leading."
	self
		assert: (aFontMetrics ascent abs + aFontMetrics descent abs + aFontMetrics leading abs
				closeTo: aFont lineSpacing).	"em height is a font size"
	self assert: aFontMetrics fontSize equals: aFont size.

	^ aFontMetrics
]

{ #category : #accessing }
SkiaFontExamples >> fromTypefaceAndSize [
	<gtExample>
	<return: #SkiaFont>
	| aTypeface aFont |
	aTypeface := SkiaTypeface new.
	aFont := SkiaFont typeface: aTypeface size: 20.

	self assert: aFont edging equals: SkiaFontEdging AntiAlias.
	self assert: aFont hinting equals: SkiaFontHinting Normal.
	self assert: aFont lineSpacing > 0.
	self assert: aFont isBaselineSnap.
	self assert: aFont isEmbeddedBitmaps not.
	self assert: aFont isEmbolden not.
	self assert: aFont isForceAutoHinting not.
	self assert: aFont isLinearMetrics not.
	self assert: aFont isSubpixel not.
	self assert: aFont scale equals: 1.0.
	self assert: aFont size equals: 20.0.
	self assert: aFont skew equals: 0.0.

	^ aFont
]

{ #category : #accessing }
SkiaFontExamples >> measureHelloWorld [
	<gtExample>
	<return: #AssertionFailure>
	| aFont aPaint theTextMetrics |
	aFont := self default.
	aPaint := SkiaPaint new color: Color black.
	theTextMetrics := aFont measureString: 'Hello' paint: aPaint.

	self assert: theTextMetrics advance > 0.
	self assert: theTextMetrics bounds hasPositiveExtent.

	^ theTextMetrics
]

{ #category : #accessing }
SkiaFontExamples >> toGlyphsHelloWorld [
	<gtExample>
	<return: #AssertionFailure>
	| aFont theGlyphs |
	aFont := self default.

	theGlyphs := aFont stringToGlyphs: 'Hello'.
	self assert: theGlyphs equals: #[43 0 72 0 79 0 79 0 82 0].

	^ theGlyphs
]
