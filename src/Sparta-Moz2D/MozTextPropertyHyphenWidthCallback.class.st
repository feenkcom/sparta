Class {
	#name : #MozTextPropertyHyphenWidthCallback,
	#superclass : #MozTextPropertyCallback,
	#category : 'Sparta-Moz2D-Text-Callbacks'
}

{ #category : #properties }
MozTextPropertyHyphenWidthCallback >> collectFrom: aPropertyProvider in: aPropertyCollector [
	| aWidth |

	aWidth := aPropertyProvider hyphenWidth.
	self primSetHyphenWidth: aWidth collector: aPropertyCollector
]

{ #category : #'private - ffi' }
MozTextPropertyHyphenWidthCallback >> primSetHyphenWidth: aHyphenWidth collector: aPropertyCollector [

	^ self ffiCall: #( void moz2d_text_run_property_collector_set_hyphen_width (void* aPropertyCollector, double aHyphenWidth ) )
]
