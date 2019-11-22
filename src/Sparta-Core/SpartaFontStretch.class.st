Class {
	#name : #SpartaFontStretch,
	#superclass : #SharedPool,
	#instVars : [
		'name',
		'value'
	],
	#classVars : [
		'Condensed',
		'Expanded',
		'ExtraCondensed',
		'ExtraExpanded',
		'Normal',
		'SemiCondensed',
		'SemiExpanded',
		'UltraCondensed',
		'UltraExpanded'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
SpartaFontStretch class >> condensed [
	^ Condensed
]

{ #category : #accessing }
SpartaFontStretch class >> expanded [
	^ Expanded
]

{ #category : #accessing }
SpartaFontStretch class >> extraCondensed [
	^ ExtraCondensed
]

{ #category : #accessing }
SpartaFontStretch class >> extraExpanded [
	^ ExtraExpanded
]

{ #category : #'class initialization' }
SpartaFontStretch class >> initialize [
	UltraCondensed := self stretch: 0 name: #ultraCondensed.
	ExtraCondensed := self stretch: 1 name: #extraCondensed.
	Condensed := self stretch: 2 name: #condensed.
	SemiCondensed := self stretch: 3 name: #semiCondensed.
	Normal := self stretch: 4 name: #normal.
	SemiExpanded := self stretch: 5 name: #semiExpanded.
	Expanded := self stretch: 6 name: #expanded.
	ExtraExpanded := self stretch: 7 name: #extraExpanded.
	UltraExpanded := self stretch: 8 name: #ultraExpanded.
]

{ #category : #accessing }
SpartaFontStretch class >> normal [
	^ Normal
]

{ #category : #accessing }
SpartaFontStretch class >> semiCondensed [
	^ SemiCondensed
]

{ #category : #accessing }
SpartaFontStretch class >> semiExpanded [
	^ SemiExpanded
]

{ #category : #'instance creation' }
SpartaFontStretch class >> stretch: aStretchValue name: aStretchName [
	^ self new
		value: aStretchValue;
		name: aStretchName
]

{ #category : #accessing }
SpartaFontStretch class >> ultraCondensed [
	^ UltraCondensed
]

{ #category : #accessing }
SpartaFontStretch class >> ultraExpanded [
	^ UltraExpanded
]

{ #category : #comparing }
SpartaFontStretch >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ value = anObject value
]

{ #category : #comparing }
SpartaFontStretch >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ value hash
]

{ #category : #accessing }
SpartaFontStretch >> name [
	<return: #Symbol>

	^ name
]

{ #category : #accessing }
SpartaFontStretch >> name: aSymbol [
	name := aSymbol
]

{ #category : #printing }
SpartaFontStretch >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' name: ';
		print: name.
	aStream
		nextPutAll: ' value: ';
		print: value
]

{ #category : #evaluating }
SpartaFontStretch >> value [
	<return: #Number>

	^ value
]

{ #category : #accessing }
SpartaFontStretch >> value: aNumber [
	value := aNumber
]
