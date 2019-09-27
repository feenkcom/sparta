Class {
	#name : #MozTextPropertySpacingCallback,
	#superclass : #MozTextPropertyCallback,
	#category : 'Sparta-Moz2D-Text-Callbacks'
}

{ #category : #properties }
MozTextPropertySpacingCallback >> collectFrom: aPropertyProvider in: aPropertyCollector [
	| aStart anEnd aHandle anArray |
	
	aHandle := self primGetSpacing: aPropertyCollector.
	aStart := self primGetStart: aPropertyCollector.
	anEnd := self primGetEnd: aPropertyCollector.
	
	anArray := FFIExternalArray fromHandle: aHandle getHandle type: 'double' size: (anEnd - aStart) * 2.
	aPropertyProvider spacingWithin: (aStart + 1 to: anEnd) in: anArray.
]

{ #category : #'private - ffi' }
MozTextPropertySpacingCallback >> primGetEnd: aPropertyCollector [

	^ self ffiCall: #( uint32 moz2d_text_run_spacing_collector_get_end ( void* aPropertyCollector ) )
]

{ #category : #'private - ffi' }
MozTextPropertySpacingCallback >> primGetSpacing: aPropertyCollector [

	^ self ffiCall: #( void* moz2d_text_run_spacing_collector_get_spacing ( void* aPropertyCollector ) )
]

{ #category : #'private - ffi' }
MozTextPropertySpacingCallback >> primGetStart: aPropertyCollector [

	^ self ffiCall: #( uint32 moz2d_text_run_spacing_collector_get_start ( void* aPropertyCollector ) )
]
