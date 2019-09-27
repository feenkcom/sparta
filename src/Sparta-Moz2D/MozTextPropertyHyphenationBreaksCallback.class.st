Class {
	#name : #MozTextPropertyHyphenationBreaksCallback,
	#superclass : #MozTextPropertyCallback,
	#category : 'Sparta-Moz2D-Text-Callbacks'
}

{ #category : #properties }
MozTextPropertyHyphenationBreaksCallback >> collectFrom: aPropertyProvider in: aPropertyCollector [
	| aStart anEnd aHandle anArray |

	aHandle := self primGetBreaks: aPropertyCollector.
	aStart := self primGetStart: aPropertyCollector.
	anEnd := self primGetEnd: aPropertyCollector.

	anArray := FFIExternalArray fromHandle: aHandle getHandle type: FFIBool size: (anEnd - aStart).
	aPropertyProvider hyphenationBreaksWithin: (aStart + 1 to: anEnd) in: anArray
]

{ #category : #'private - ffi' }
MozTextPropertyHyphenationBreaksCallback >> primGetBreaks: aPropertyCollector [

	^ self ffiCall: #( void* moz2d_text_run_breaks_collector_get_breaks ( void* aPropertyCollector ) )
]

{ #category : #'private - ffi' }
MozTextPropertyHyphenationBreaksCallback >> primGetEnd: aPropertyCollector [

	^ self ffiCall: #( uint32 moz2d_text_run_breaks_collector_get_end ( void* aPropertyCollector ) )
]

{ #category : #'private - ffi' }
MozTextPropertyHyphenationBreaksCallback >> primGetStart: aPropertyCollector [

	^ self ffiCall: #( uint32 moz2d_text_run_breaks_collector_get_start ( void* aPropertyCollector ) )
]
