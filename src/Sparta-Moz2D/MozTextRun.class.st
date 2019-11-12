Class {
	#name : #MozTextRun,
	#superclass : #FFIExternalObject,
	#traits : 'TSpTextRun + TMozLibrary + TMozInlineRefPtr + TMozDebug',
	#classTraits : 'TSpTextRun classTrait + TMozLibrary classTrait + TMozInlineRefPtr classTrait + TMozDebug classTrait',
	#instVars : [
		'metricsProvider',
		'buffer',
		'length',
		'bits'
	],
	#category : #'Sparta-Moz2D-Text'
}

{ #category : #'instance creation' }
MozTextRun class >> fromString: aString [
	"Toy API. For testing purpose only"
	| canvas font flags |
	canvas := MozCanvas extent: 1@1.
	
	font := canvas font
		size: 20;
		sansSerif;
		build.

	flags := 0.
	flags := flags | MozTextFlags TEXT_ENABLE_HYPHEN_BREAKS value.
	flags := flags | MozTextFlags TEXT_ENABLE_SPACING value.
	flags := flags | MozTextFlags TEXT_NEED_BOUNDING_BOX value.
		
	^ font makeTextRun: aString canvas: canvas flags: flags
]

{ #category : #'private - ffi' }
MozTextRun class >> primRelease: aHandle [
	^ self ffiCall: #( void moz2d_text_run_release ( void* aHandle ) )
]

{ #category : #accessing }
MozTextRun >> bits [
	"Return how many bits one character takes"
	<return: #Number>
	
	^ bits
]

{ #category : #accessing }
MozTextRun >> bits: aNumber [
	bits := aNumber
]

{ #category : #accessing }
MozTextRun >> buffer [
	^ buffer
]

{ #category : #accessing }
MozTextRun >> buffer: aByteArray [
	buffer := aByteArray
]

{ #category : #accessing }
MozTextRun >> length [
	"Return how many characters (not glyphs) are behind this text run"
	<return: #Number>

	^ length
]

{ #category : #accessing }
MozTextRun >> length: aNumber [
	
	length := aNumber
]

{ #category : #accessing }
MozTextRun >> metricsProvider [
	^ metricsProvider
]

{ #category : #accessing }
MozTextRun >> metricsProvider: aMetricsProvider [
	metricsProvider := aMetricsProvider
]

{ #category : #'private - ffi' }
MozTextRun >> primFontMetrics: aMetrics [

	^ self ffiCall: #(void moz2d_text_run_font_metrics (
		self,
		#MozNativeFontMetrics aMetrics) )
]

{ #category : #'private - ffi' }
MozTextRun >> primGetLength [

	^ self ffiCall: #(uint32 moz2d_text_run_get_length(self))
]

{ #category : #accessing }
MozTextRun >> size [
	"Return a number of glyphs that build this text.
	Note: in UTF encoding a character may be represented by 1-4 glyphs depending on char's code"
	<return: #Number>

	^ self primGetLength
]
