Class {
	#name : #SpartaCairoTextPainter,
	#superclass : #SpartaTextPainter,
	#traits : 'TSpartaCairoLibrary + TSpartaCairoContext',
	#classTraits : 'TSpartaCairoLibrary classTrait + TSpartaCairoContext classTrait',
	#category : #'Sparta-Cairo-Builders'
}

{ #category : #'accessing - breaks' }
SpartaCairoTextPainter >> breakNone [
	
]

{ #category : #'accessing - breaks' }
SpartaCairoTextPainter >> breakNormal [
	
]

{ #category : #'accessing - breaks' }
SpartaCairoTextPainter >> breakWordWrap [
	
]

{ #category : #drawing }
SpartaCairoTextPainter >> fillString: aString withColor: aFillColor strokeColor: aStrokeColor [
	| aTextRun |
	self
		assert: [ aString isNotNil ]
		description: [ 'String must not be nil' ].

	self
		assert: [ font isNotNil ]
		description: [ 'Font must not be nil' ].

	aTextRun := self textRun.
	
	self fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor.

	aTextRun release
]

{ #category : #drawing }
SpartaCairoTextPainter >> fillTextRun: aTextRun withColor: aFillColor strokeColor: aStrokeColor [

	self primSetSourceR: aFillColor red G: aFillColor green B: aFillColor blue A: aFillColor alpha.
	self primSetScaledFont: aTextRun scaledFont.
	self primTranslateX: baseline x Y: baseline y.
	self primShowGlyphs: aTextRun glyphs num: aTextRun glyphs size.
	self primTranslateX: baseline x negated Y: baseline y negated
]

{ #category : #'accessing - orientation' }
SpartaCairoTextPainter >> horizontal [
	
]

{ #category : #measurement }
SpartaCairoTextPainter >> measure [
	| aMetrics aMetricsProvider aTextRun |
	aMetrics := self metrics.
	aMetricsProvider := self metricsProvider.
	aTextRun := self textRun.
	aMetricsProvider measure: aTextRun in: aMetrics.
	aTextRun release.
	^ aMetrics
]

{ #category : #'instance creation' }
SpartaCairoTextPainter >> metrics [
	| aMetrics |

	aMetrics := SpartaMetrics new.
	aMetrics canvas: canvas.
	aMetrics spacing: spacing.

	^ aMetrics
]

{ #category : #'instance creation' }
SpartaCairoTextPainter >> metricsProvider [
	^ SpartaCairoMetricsProvider new
]

{ #category : #'private - ffi' }
SpartaCairoTextPainter >> primSetScaledFont: aScaledFont [

	^ self ffiCall: #( void cairo_set_scaled_font (
		SpartaCairoCanvas canvas,
		SpartaCairoScaledFont aScaledFont ) )
]

{ #category : #'private - ffi' }
SpartaCairoTextPainter >> primShowGlyphs: aGlyphsArray num: aNumberOfGlyphs [

	^ self ffiCall: #( void cairo_show_glyphs (
		SpartaCairoCanvas canvas,
		FFIExternalArray aGlyphsArray,
		int aNumberOfGlyphs ) )
]

{ #category : #'instance creation' }
SpartaCairoTextPainter >> textRun [
	^ ((font scaledFontFor: canvas transform current)
		makeTextRunNoRelease: text)
			autoRelease
]

{ #category : #'accessing - orientation' }
SpartaCairoTextPainter >> verticalSidewaysLeft [
	
]
