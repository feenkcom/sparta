Class {
	#name : #MozTextPropertyDrawTargetCallback,
	#superclass : #MozTextPropertyCallback,
	#category : 'Sparta-Moz2D-Text-Callbacks'
}

{ #category : #properties }
MozTextPropertyDrawTargetCallback >> collectFrom: aPropertyProvider in: aPropertyCollector [
	| aCanvas |

	aCanvas := aPropertyProvider canvas.
	self primSetDrawTarget: aCanvas collector: aPropertyCollector
]

{ #category : #'private - ffi' }
MozTextPropertyDrawTargetCallback >> primSetDrawTarget: aDrawTarget collector: aPropertyCollector [

	^ self ffiCall: #( void moz2d_text_run_property_collector_set_draw_target (void* aPropertyCollector, MozCanvas aDrawTarget ) )
]
