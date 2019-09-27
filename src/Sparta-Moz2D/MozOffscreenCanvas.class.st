Class {
	#name : #MozOffscreenCanvas,
	#superclass : #MozCanvas,
	#instVars : [
		'session'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Sparta-Moz2D'
}

{ #category : #cleanup }
MozOffscreenCanvas class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #'instance creation' }
MozOffscreenCanvas class >> new [
	^ self basicNew
		initializeWith: (self
			primCreateWidth: 1
			height: 1
			format: MozSurfaceFormat B8G8R8A8) getHandle;
		initialize;
		autoRelease;
		yourself
]

{ #category : #accessing }
MozOffscreenCanvas class >> uniqueInstance [
	^ uniqueInstance
		ifNil: [ uniqueInstance := self new ]
		ifNotNil: [ :aCanvas | aCanvas isValid
			ifTrue: [ uniqueInstance ]
			ifFalse: [ uniqueInstance := self new ] ]
]

{ #category : #initialization }
MozOffscreenCanvas >> initializeWith: aHandle [
	
	handle := aHandle.
	session := Smalltalk session
]

{ #category : #testing }
MozOffscreenCanvas >> isValid [
	^ session == Smalltalk session and: [
		handle isNull not and: [
			super isValid ] ]
]
