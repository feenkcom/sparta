Class {
	#name : #SpTextRunIterator16Bit,
	#superclass : #SpTextRunIterator,
	#category : #'Sparta-Core-Text'
}

{ #category : #private }
SpTextRunIterator16Bit >> next16BitWord [
	| aWord |
	
	aWord := self peek16BitWord.
	index := index + 1.
	^ aWord
]

{ #category : #'stream access' }
SpTextRunIterator16Bit >> nextCharacter [
	^ self nextWord asCharacter
]

{ #category : #'stream access' }
SpTextRunIterator16Bit >> nextUnit [
	^ self nextCharacter
]

{ #category : #'stream access' }
SpTextRunIterator16Bit >> nextUnitCode [
	^ self nextWord
]

{ #category : #'stream access' }
SpTextRunIterator16Bit >> nextWord [
	| aWord |

	aWord := self peek16BitWord.
	index := index + 1.
	^ aWord
]

{ #category : #private }
SpTextRunIterator16Bit >> peek16BitWord [
	| aBuffer aFirst aSecond anIndex |
	aBuffer := textRun buffer.
	
	anIndex := (index - 1) * 2 + 1.
	aFirst := aBuffer byteAt: anIndex.
	aSecond := aBuffer byteAt: anIndex + 1.
	^ (aSecond << 8) + aFirst
]

{ #category : #'stream access' }
SpTextRunIterator16Bit >> skip [
	index := index + 1
]

{ #category : #'stream access' }
SpTextRunIterator16Bit >> skipUnit [
	index := index + 1
]
