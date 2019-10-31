Class {
	#name : #MozSkiaOffscreenCanvas,
	#superclass : #MozSkiaCanvas,
	#instVars : [
		'session'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Sparta-Moz2D-Skia'
}

{ #category : #cleanup }
MozSkiaOffscreenCanvas class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #'instance creation' }
MozSkiaOffscreenCanvas class >> new [
	^ self basicNew
		initializeWith: (self
			primCreateWidth: 1
			height: 1
			format: MozSurfaceFormat B8G8R8A8) getHandle;
		autoRelease;
		yourself
]

{ #category : #accessing }
MozSkiaOffscreenCanvas class >> uniqueInstance [
	^ uniqueInstance
		ifNil: [ uniqueInstance := self new ]
		ifNotNil: [ :aCanvas | aCanvas isValid
			ifTrue: [ uniqueInstance ]
			ifFalse: [ uniqueInstance := self new ] ]
]

{ #category : #initialization }
MozSkiaOffscreenCanvas >> initializeWith: aHandle [
	
	handle := aHandle.
	session := Smalltalk session
]

{ #category : #testing }
MozSkiaOffscreenCanvas >> isValid [
	^ session == Smalltalk session and: [
		handle isNull not and: [
			super isValid ] ]
]
