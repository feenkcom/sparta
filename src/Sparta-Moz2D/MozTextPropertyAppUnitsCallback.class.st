Class {
	#name : #MozTextPropertyAppUnitsCallback,
	#superclass : #MozTextPropertyCallback,
	#category : 'Sparta-Moz2D-Text-Callbacks'
}

{ #category : #properties }
MozTextPropertyAppUnitsCallback >> collectFrom: aPropertyProvider in: aPropertyCollector [
	| anAppUnits |

	anAppUnits := aPropertyProvider appUnitsPerDevUnit.
	self primSetAppUnits: anAppUnits collector: aPropertyCollector
]

{ #category : #'private - ffi' }
MozTextPropertyAppUnitsCallback >> primSetAppUnits: anAppUnits collector: aPropertyCollector [

	^ self ffiCall: #( void moz2d_text_run_property_collector_set_app_units (void* aPropertyCollector, uint32 anAppUnits ) )
]
