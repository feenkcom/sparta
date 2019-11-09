"
I represent a callback funtion used by text property provider to use image-side implementation of properties logic. Callbacks are used to execute Smalltalk code from C/C++
"
Class {
	#name : #MozTextPropertyCallback,
	#superclass : #FFICallback,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#instVars : [
		'session'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Sparta-Moz2D-Text-Callbacks'
}

{ #category : #cleanup }
MozTextPropertyCallback class >> cleanAll [
	<script: 'cleanAll'>

	self withAllSubclassesDo: #cleanUp
]

{ #category : #cleanup }
MozTextPropertyCallback class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #'callback spec' }
MozTextPropertyCallback class >> fnSpec [
	"Return specification of callback funtion in C"

	^ #(void (int, void* aPropertyCollector))
]

{ #category : #accessing }
MozTextPropertyCallback class >> uniqueInstance [
	^ uniqueInstance
		ifNil: [ uniqueInstance := self new ]
		ifNotNil: [ :aCallback | aCallback isValid
			ifTrue: [ uniqueInstance ]
			ifFalse: [ uniqueInstance := self new ] ]
]

{ #category : #accessing }
MozTextPropertyCallback >> blockSpec [
	^ [ :anIdentityHash :aPropertyCollector |
			(MozTextPropertyProvider fromIdentityHash: anIdentityHash)
				ifNotNil: [ :aPropertyProvider |
					self collectFrom: aPropertyProvider in: aPropertyCollector	] ]
]

{ #category : #properties }
MozTextPropertyCallback >> collectFrom: aPropertyProvider in: aPropertyCollector [
	^ self subclassResponsibility
]

{ #category : #accessing }
MozTextPropertyCallback >> fnSpec [
	^ self class fnSpec
]

{ #category : #initialization }
MozTextPropertyCallback >> initialize [
	super initialize.
	
	self
		signature: self class fnSpec
		block: self blockSpec.
	
	session := Smalltalk session
]

{ #category : #testing }
MozTextPropertyCallback >> isValid [
	"Return true if I am a valid callback function, false otherwise"
	<return: #Boolean>

	^ session == Smalltalk session
		and: [ self thunk isNull not ]
]
