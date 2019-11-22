Class {
	#name : #SpartaFontWeight,
	#superclass : #SharedPool,
	#instVars : [
		'name',
		'value'
	],
	#classVars : [
		'Black',
		'Bold',
		'ExtraBlack',
		'ExtraBold',
		'ExtraLight',
		'Invisible',
		'Light',
		'Medium',
		'Normal',
		'SemiBold',
		'Thin',
		'Weights'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #accessing }
SpartaFontWeight class >> black [
	^ Black
]

{ #category : #accessing }
SpartaFontWeight class >> bold [
	^ Bold
]

{ #category : #accessing }
SpartaFontWeight class >> extraBlack [
	^ ExtraBlack
]

{ #category : #accessing }
SpartaFontWeight class >> extraBold [
	^ ExtraBold
]

{ #category : #accessing }
SpartaFontWeight class >> extraLight [
	^ ExtraLight
]

{ #category : #'class initialization' }
SpartaFontWeight class >> fromNumber: aNumber [
	<return: #SpartaFontWeight>
	Weights
		ifNil: [ Weights := (self classPool values
				select: [ :eachValue | eachValue isKindOf: self ]
				thenCollect: [ :eachWeight | eachWeight value -> eachWeight ])
				as: Dictionary ].
	^ Weights
		at: aNumber
		ifAbsent: [ self weight: aNumber name: #custom ]
]

{ #category : #'class initialization' }
SpartaFontWeight class >> initialize [
	Invisible := self weight: 0 name: #invisible.
	Thin := self weight: 100 name: #thin.
	ExtraLight := self weight: 200 name: #extraLight.
	Light := self weight: 300 name: #light.
	Normal := self weight: 400 name: #normal.
	Medium := self weight: 500 name: #medium.
	SemiBold := self weight: 600 name: #semiBold.
	Bold := self weight: 700 name: #bold.
	ExtraBold := self weight: 800 name: #extraBold.
	Black := self weight: 900 name: #black.
	ExtraBlack := self weight: 1000 name: #extraBlack.
]

{ #category : #accessing }
SpartaFontWeight class >> invisible [
	^ Invisible
]

{ #category : #accessing }
SpartaFontWeight class >> light [
	^ Light
]

{ #category : #accessing }
SpartaFontWeight class >> medium [
	^ Medium
]

{ #category : #accessing }
SpartaFontWeight class >> normal [
	^ Normal
]

{ #category : #accessing }
SpartaFontWeight class >> semiBold [
	^ SemiBold
]

{ #category : #accessing }
SpartaFontWeight class >> thin [
	^ Thin
]

{ #category : #'instance creation' }
SpartaFontWeight class >> weight: aWeightValue name: aWeightName [
	^ self new
		value: aWeightValue;
		name: aWeightName
]

{ #category : #comparing }
SpartaFontWeight >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ value = anObject value
]

{ #category : #comparing }
SpartaFontWeight >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ value hash
]

{ #category : #accessing }
SpartaFontWeight >> name [
	<return: #Symbol>

	^ name
]

{ #category : #accessing }
SpartaFontWeight >> name: aSymbol [
	name := aSymbol
]

{ #category : #printing }
SpartaFontWeight >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' value: ';
		print: value.
	aStream
		nextPutAll: ' name: ';
		print: name
]

{ #category : #accessing }
SpartaFontWeight >> value [
	<return: #Number>

	^ value
]

{ #category : #accessing }
SpartaFontWeight >> value: aNumber [
	value := aNumber
]
