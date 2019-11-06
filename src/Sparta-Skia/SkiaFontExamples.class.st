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
	self assert: aFont scale equals: 1.0.
	self assert: aFont size equals: 12.0.
	self assert: aFont skew equals: 0.0.
	
	^ aFont
]

{ #category : #accessing }
SkiaFontExamples >> fontMetrics [
	<gtExample>
	| aFont aFontMetrics |

	aFont := self default.
	aFontMetrics := aFont metrics.

	"Return the recommended spacing between lines: the sum of metrics descent, ascent, and leading."
	self assert: (aFontMetrics ascent abs + aFontMetrics descent abs + aFontMetrics leading abs closeTo: aFont lineSpacing).
	
	"em height is a font size"
	self assert: aFontMetrics emHeight equals: aFont size.

	^ aFontMetrics
]

{ #category : #accessing }
SkiaFontExamples >> fontMetricsAsSparta [
	<gtExample>
	| aFont aFontMetrics |

	aFont := self default.
	aFontMetrics := aFont metrics asSpartaMetrics.

	^ aFontMetrics
]

{ #category : #accessing }
SkiaFontExamples >> fromTypefaceAndSize [
	<gtExample>
	| aTypeface aFont |
	
	aTypeface := SkiaTypeface new.
	aFont := SkiaFont typeface: aTypeface size: 20.
	
	"font consumes a typeface"
	self assert: (GtBoxerValueBox boxedPointerOf: aTypeface) isNull.
	
	self assert: aFont edging equals: SkiaFontEdging AntiAlias.
	self assert: aFont hinting equals: SkiaFontHinting Normal.
	self assert: aFont lineSpacing equals: 20.0.
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
	| aFont theGlyphs |
	
	aFont := self default.
	theGlyphs := (aFont stringToGlyphs: 'Hello') asArray.
	
	self assert: theGlyphs equals: #(43 72 79 79 82).

	^ theGlyphs
]
