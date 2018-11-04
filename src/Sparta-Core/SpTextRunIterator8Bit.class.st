Class {
	#name : #SpTextRunIterator8Bit,
	#superclass : #SpTextRunIterator,
	#category : #'Sparta-Core-Text'
}

{ #category : #'stream access' }
SpTextRunIterator8Bit >> nextCharacter [
	| aWord |
	
	aWord := textRun buffer at: index.
	index := index + 1.
	^ aWord
]

{ #category : #'stream access' }
SpTextRunIterator8Bit >> nextUnit [
	^ self nextCharacter
]

{ #category : #'stream access' }
SpTextRunIterator8Bit >> nextUnitCode [
	^ self nextWord
]

{ #category : #'stream access' }
SpTextRunIterator8Bit >> nextWord [
	^ self nextCharacter asInteger
]

{ #category : #'stream access' }
SpTextRunIterator8Bit >> skip [

	index := index + 1
]

{ #category : #'stream access' }
SpTextRunIterator8Bit >> skipUnit [		
	index := index + 1
]

{ #category : #accessing }
SpTextRunIterator8Bit >> unitPosition [
	"In case of 8bit unit position is equal to character position"
	<return: #Number>

	^ index
]
