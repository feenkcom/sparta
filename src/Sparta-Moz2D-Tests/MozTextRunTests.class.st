Class {
	#name : #MozTextRunTests,
	#superclass : #MozTestCase,
	#category : #'Sparta-Moz2D-Tests'
}

{ #category : #tests }
MozTextRunTests >> testOneAsciiCharacter [
	| aTextRun |

	aTextRun := MozTextRun fromString: 'a'.
	
	self assert: aTextRun length equals: 1. 
	self assert: aTextRun size equals: 1.
	self assert: aTextRun bits equals: 8.
	self assert: aTextRun buffer equals: 'a'.
]

{ #category : #tests }
MozTextRunTests >> testOneEmoji [
	| aTextRun |

	aTextRun := MozTextRun fromString: '😃'.
	
	self assert: aTextRun length equals: 1. 
	self assert: aTextRun size equals: 2.
	self assert: aTextRun bits equals: 32.
	self assert: aTextRun buffer equals: #[61 216 3 222].
]

{ #category : #tests }
MozTextRunTests >> testOneEmojiAndAsciiCharacter [
	| aTextRun |

	aTextRun := MozTextRun fromString: '😃a'.
	
	self assert: aTextRun length equals: 2. 
	self assert: aTextRun size equals: 3.
	self assert: aTextRun bits equals: 32.
	self assert: aTextRun buffer equals: #[61 216 3 222 97 0].
]
