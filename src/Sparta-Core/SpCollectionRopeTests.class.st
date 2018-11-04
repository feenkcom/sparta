Class {
	#name : #SpCollectionRopeTests,
	#superclass : #TestCase,
	#instVars : [
		'rope'
	],
	#category : #'Sparta-Core-Text-Rope-Tests'
}

{ #category : #testing }
SpCollectionRopeTests class >> isAbstract [
	^ super isAbstract or: [ self = SpCollectionRopeTests ]
]

{ #category : #requirements }
SpCollectionRopeTests >> collection [
	^ self subclassResponsibility
]

{ #category : #running }
SpCollectionRopeTests >> setUp [
	super setUp.
	
	rope := SpCollectionRope collection: self collection.
]

{ #category : #running }
SpCollectionRopeTests >> tearDown [
	super tearDown.
	
	rope := nil
]

{ #category : #tests }
SpCollectionRopeTests >> testAt [
	| elements |
	elements := (1 to: self collection size) collect: [ :index | rope at: index ].
	self assert: elements equals: self collection
]

{ #category : #tests }
SpCollectionRopeTests >> testDepth [
	
	self assert: rope depth equals: 0
]

{ #category : #tests }
SpCollectionRopeTests >> testFromTo [
	|collection|
	collection := self collection.
	
	1 to: collection size do: [ :from |
		from to: collection size do: [ :to |
			|subrope|
			subrope := rope from: from to: to.
			self assert: subrope size equals: to - from + 1.
			1 to: to - from + 1 do: [ :index |
				self assert: (subrope at: index) equals: (collection at: from + index - 1) ] ] ]
]

{ #category : #tests }
SpCollectionRopeTests >> testIterator [
	|collection|
	collection := self collection.

	1 to: collection size do: [ :from |
		from to: collection size do: [ :to |
			|iterator|
			iterator := rope iterator: from to: to.
			1 to: to - from + 1 do: [ :index |
				self assert: iterator hasNext equals: true.
				self assert: iterator position equals: from + index - 1.
				self assert: iterator next equals: (collection at: from + index - 1) ] ] ]
]

{ #category : #tests }
SpCollectionRopeTests >> testIteratorNextSegment [

	
]

{ #category : #tests }
SpCollectionRopeTests >> testSize [

	self assert: rope size equals: self collection size
]
