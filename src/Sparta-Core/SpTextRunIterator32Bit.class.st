Class {
	#name : #SpTextRunIterator32Bit,
	#superclass : #SpTextRunIterator,
	#instVars : [
		'offset'
	],
	#category : #'Sparta-Core-Text'
}

{ #category : #initialization }
SpTextRunIterator32Bit >> initialize [
	super initialize.

	offset := 0
]

{ #category : #private }
SpTextRunIterator32Bit >> next16BitWord [
	| aWord |
	
	aWord := self peek16BitWord.

	(aWord < 16rD800 or: [ aWord > 16rDBFF ])
		ifTrue: [ index := index + 1 ]
		ifFalse: [ offset := offset + 2 ].
	
	^ aWord
]

{ #category : #'stream access' }
SpTextRunIterator32Bit >> nextCharacter [
	^ self nextWord asCharacter
]

{ #category : #'stream access' }
SpTextRunIterator32Bit >> nextUnit [
	^ self next16BitWord asCharacter
]

{ #category : #'stream access' }
SpTextRunIterator32Bit >> nextUnitCode [
	^ self next16BitWord
]

{ #category : #'stream access' }
SpTextRunIterator32Bit >> nextWord [
	| aWord |

	aWord := self peek16BitWord.
	index := index + 1.
	^ (aWord < 16rD800 or: [ aWord > 16rDBFF ])
		ifTrue: [ aWord ]
		ifFalse: [ 
			| aLead aTrail aCode |
			aLead := aWord.
			aTrail := self peek16BitWord.
			aCode := (aLead - 16rD800) * 16r400 + (aTrail - 16rDC00).
			"increase offset by 2 bits"
			offset := offset + 2.
			16r10000 + aCode ]
]

{ #category : #private }
SpTextRunIterator32Bit >> peek16BitWord [
	| aBuffer aFirst aSecond anIndex |
	aBuffer := textRun buffer.
	
	anIndex := (index - 1) * 2 + 1 + offset.
	aFirst := aBuffer byteAt: anIndex.
	aSecond := aBuffer byteAt: anIndex + 1.
	^ (aSecond << 8) + aFirst
]

{ #category : #'stream access' }
SpTextRunIterator32Bit >> skip [		
	self nextWord
]

{ #category : #'stream access' }
SpTextRunIterator32Bit >> skipUnit [
	self nextUnit
]
