Class {
	#name : #SpText,
	#superclass : #Object,
	#instVars : [
		'rope',
		'selections'
	],
	#category : #'Sparta-Core-Text-Model'
}

{ #category : #'instance creation' }
SpText class >> fromFile: aFile [
	^ self new
		initializeWith: (SpRope fromFile: aFile);
		yourself
]

{ #category : #'instance creation' }
SpText class >> fromRope: aRope [
	^ self new
		initializeWith: aRope;
		yourself
]

{ #category : #'instance creation' }
SpText class >> fromString: aString [
	^ self new
		initializeWith: (SpRope fromCollection: aString);
		yourself
]

{ #category : #'text operation' }
SpText >> attributes: anAttributesCollection [
	rope := rope attributes: anAttributesCollection from: 1 to: rope size
]

{ #category : #'text operation' }
SpText >> attributes: anAttributesCollection from: aStart to: anEnd [
	rope := rope attributes: anAttributesCollection from: aStart to: anEnd
]

{ #category : #drawing }
SpText >> drawOn: aCanvas [
	| aRope layout |
	aRope := rope.
	layout := SpMultilineTextLayout rope: aRope.
	layout renderOn: aCanvas.
	selections
		select: [ :selection | selection interval isNotEmpty ]
		thenDo: [ :selection | 
			| start end startPosition endPosition |
			start := selection interval start.
			end := selection interval end.
			startPosition := layout positionAt: start.
			endPosition := layout positionAt: end ]
]

{ #category : #drawing }
SpText >> drawOn: aCanvas from: aStart to: anEnd [
	| aRope layout |
	aRope := rope from: aStart to: anEnd.
	layout := SpMultilineTextLayout rope: aRope.
	layout renderOn: aCanvas.
	selections
		select: [ :selection | selection interval isNotEmpty ]
		thenDo: [ :selection | 
			| start end |
			start := selection interval start.
			end := selection interval end. ]
]

{ #category : #'text operation' }
SpText >> from: aStart to: anEnd [
	rope := rope from: aStart to: anEnd
]

{ #category : #initialization }
SpText >> initializeWith: aRope [
	rope := aRope.
	selections := OrderedCollection new.
]

{ #category : #'text operation' }
SpText >> insert: aRope at: anIndex [
	rope := rope insert: aRope at: anIndex
]

{ #category : #accessing }
SpText >> rope [
	^ rope
]

{ #category : #accessing }
SpText >> size [
	^ rope size
]

{ #category : #dispatch }
SpText >> spartaFillOn: aSpartaCanvas with: aTextPainter [
	(SpMultilineTextLayout rope: rope)
		renderOn: aSpartaCanvas
]
