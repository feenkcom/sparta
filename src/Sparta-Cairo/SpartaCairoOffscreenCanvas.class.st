Class {
	#name : #SpartaCairoOffscreenCanvas,
	#superclass : #SpartaCairoCanvas,
	#instVars : [
		'session'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Sparta-Cairo'
}

{ #category : #cleanup }
SpartaCairoOffscreenCanvas class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #'instance creation' }
SpartaCairoOffscreenCanvas class >> new [
	^ self extent: 1@1
]

{ #category : #'private - ffi' }
SpartaCairoOffscreenCanvas class >> primCreate: aSurface [

	^ self ffiCall: #(SpartaCairoOffscreenCanvas cairo_create (SpartaCairoSurface aSurface) )
]

{ #category : #accessing }
SpartaCairoOffscreenCanvas class >> uniqueInstance [
	^ uniqueInstance
		ifNil: [ uniqueInstance := self new ]
		ifNotNil: [ :aCanvas | aCanvas isValid
			ifTrue: [ uniqueInstance ]
			ifFalse: [ uniqueInstance := self new ] ]
]

{ #category : #initialization }
SpartaCairoOffscreenCanvas >> initialize [
	super initialize.
	
	session := Smalltalk session
]

{ #category : #testing }
SpartaCairoOffscreenCanvas >> isValid [
	^ session == Smalltalk session and: [
		handle isNull not ]
]
