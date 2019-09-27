Class {
	#name : #SkiaOffscreenCanvas,
	#superclass : #SkiaCanvas,
	#instVars : [
		'session'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Sparta-Moz2D-Skia'
}

{ #category : #cleanup }
SkiaOffscreenCanvas class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #'instance creation' }
SkiaOffscreenCanvas class >> new [
	^ self basicNew
		initializeWith: (self
			primCreateWidth: 1
			height: 1
			format: MozSurfaceFormat B8G8R8A8) getHandle;
		autoRelease;
		yourself
]

{ #category : #accessing }
SkiaOffscreenCanvas class >> uniqueInstance [
	^ uniqueInstance
		ifNil: [ uniqueInstance := self new ]
		ifNotNil: [ :aCanvas | aCanvas isValid
			ifTrue: [ uniqueInstance ]
			ifFalse: [ uniqueInstance := self new ] ]
]

{ #category : #initialization }
SkiaOffscreenCanvas >> initializeWith: aHandle [
	
	handle := aHandle.
	session := Smalltalk session
]

{ #category : #testing }
SkiaOffscreenCanvas >> isValid [
	^ session == Smalltalk session and: [
		handle isNull not and: [
			super isValid ] ]
]
