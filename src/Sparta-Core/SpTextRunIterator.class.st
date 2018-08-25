Class {
	#name : #SpTextRunIterator,
	#superclass : #Object,
	#instVars : [
		'textRun',
		'length',
		'index'
	],
	#category : 'Sparta-Core-Text'
}

{ #category : #'instance creation' }
SpTextRunIterator class >> on: aTextRun [
	^ self new
		on: aTextRun;
		yourself
]

{ #category : #testing }
SpTextRunIterator >> hasNext [
	"Return true if there is a word/character after current index"
	<return: #Boolean>

	^ index <= length	and: [ length > 0 ]
]

{ #category : #initialization }
SpTextRunIterator >> initialize [
	super initialize.
	
	length := 0
]

{ #category : #'stream access' }
SpTextRunIterator >> nextCharacter [
	^ self subclassResponsibility
]

{ #category : #'stream access' }
SpTextRunIterator >> nextUnit [
	^ self subclassResponsibility
]

{ #category : #'stream access' }
SpTextRunIterator >> nextUnitCode [
	^ self subclassResponsibility
]

{ #category : #'stream access' }
SpTextRunIterator >> nextWord [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
SpTextRunIterator >> on: aTextRun [
	textRun := aTextRun.
	length := aTextRun length.
	index := aTextRun isNotEmpty asBit "1 if not empty, 0 otherwise"
]

{ #category : #accessing }
SpTextRunIterator >> position [
	"Return a current character position"
	<return: #Number>

	^ index
]

{ #category : #'stream access' }
SpTextRunIterator >> skip [
	^ self subclassResponsibility
]

{ #category : #'stream access' }
SpTextRunIterator >> skip: aNumber [
	
	aNumber timesRepeat: [ self skip ]
]

{ #category : #'stream access' }
SpTextRunIterator >> skipUnit [
	^ self subclassResponsibility
]

{ #category : #'stream access' }
SpTextRunIterator >> skipUnits: aNumber [

	aNumber timesRepeat: [ self skipUnit ]
]

{ #category : #accessing }
SpTextRunIterator >> unitPosition [
	"Return a current unit position which may be different from character position"
	<return: #Number>

	^ self subclassResponsibility
]
