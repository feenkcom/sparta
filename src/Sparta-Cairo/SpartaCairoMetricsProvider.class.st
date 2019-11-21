Class {
	#name : #SpartaCairoMetricsProvider,
	#superclass : #SpartaMetricsProvider,
	#traits : 'TSpartaCairoLibrary',
	#classTraits : 'TSpartaCairoLibrary classTrait',
	#category : #'Sparta-Cairo-Text'
}

{ #category : #measurement }
SpartaCairoMetricsProvider >> measure: aSpTextRun in: aSpMetrics [
	| aTextMetrics  aFontMetrics |

	aTextMetrics := SpartaCairoTextMetrics new.
	
	self primSetScaledFont: aSpTextRun scaledFont canvas: aSpMetrics canvas.
	self
		primGlyphExtents: aSpTextRun glyphs
		num: aSpTextRun glyphs size
		metrics: aTextMetrics
		canvas: aSpMetrics canvas.

	aSpMetrics textMetrics: aTextMetrics asTextMetrics.
	
	aFontMetrics := SpartaCairoFontMetrics new.
	
	self primSetScaledFont: aSpTextRun scaledFont canvas: aSpMetrics canvas.
	self primFontExtents: aFontMetrics canvas: aSpMetrics canvas.
	
	aSpMetrics fontMetrics: aFontMetrics asFontMetrics
]

{ #category : #'private - ffi' }
SpartaCairoMetricsProvider >> primFontExtents: aFontMetrics canvas: aCanvas [

	^ self ffiCall: #( void cairo_font_extents (
		SpartaCairoCanvas aCanvas,
		SpartaCairoFontMetrics* aFontMetrics ) )
]

{ #category : #'private - ffi' }
SpartaCairoMetricsProvider >> primGlyphExtents: theGlyphs num: aGlyphsNum metrics: aTextMetrics canvas: aCanvas [

	^ self ffiCall: #( void cairo_glyph_extents (
		SpartaCairoCanvas aCanvas,
		FFIExternalArray theGlyphs,
		int aGlyphsNum,
		SpartaCairoTextMetrics* aTextMetrics ) )
]

{ #category : #'private - ffi' }
SpartaCairoMetricsProvider >> primSetScaledFont: aScaledFont canvas: aCanvas [

	^ self ffiCall: #( void cairo_set_scaled_font (
		SpartaCairoCanvas aCanvas,
		SpartaCairoScaledFont aScaledFont ) )
]
