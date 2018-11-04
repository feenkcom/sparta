"
I represent an abstract rope.

I am composed of smaller collections that is used for efficiently storing and manipulating a very long collection.

A text editing program may use a rope to represent the text being edited, so that operations such as insertion, deletion, and random access can be done efficiently.


Public API and Key Messages

- append: concatenate me with another rope
- at: get a single item at an index
- from:to: return a subrope within interval
- insert:at: insert a rope after an index
- reversed - return a reversed version of me
- size - return amount of items I contain

   Rope from: '123456789'
 
Internal Representation and Key Implementation Points.

	It is highly recommented to use iterators for read access
"
Class {
	#name : #SpRope,
	#superclass : #Object,
	#classInstVars : [
		'fibonacci'
	],
	#category : #'Sparta-Core-Text-Rope'
}

{ #category : #'rope types' }
SpRope class >> attributeRope [
	^ SpAttributeRope
]

{ #category : #cleanup }
SpRope class >> cleanUp [
	super cleanUp.
	
	fibonacci := nil
]

{ #category : #rope }
SpRope class >> collect: aLeftRope and: aRightRope [
	"I must take care of attributes when merging two ropes!
	It is guaranteed by algorithm that both ropes are non-empty!"
	| noAttributes |

	
	noAttributes := (aLeftRope hasAttributes or: [ aRightRope hasAttributes ]) not.
	noAttributes ifTrue: [
		| collectionRope |
		collectionRope := self collectionRope from: aLeftRope and: aRightRope.
		^ aLeftRope hasAttributes
			ifTrue: [ self attributeRope attributes: aLeftRope attributes rope: collectionRope ]
			ifFalse: [ collectionRope ] ].
	
	^ self concatenationRope left: aLeftRope right: aRightRope
]

{ #category : #'rope types' }
SpRope class >> collectionRope [
	^ SpCollectionRope
]

{ #category : #accessing }
SpRope class >> combineLength [
	^ 17
]

{ #category : #rope }
SpRope class >> concatenate: aLeftRope and: aRightRope [
	aLeftRope size = 0
		ifTrue: [ ^ aRightRope ].

	aRightRope size = 0
		ifTrue: [ ^ aLeftRope ].

	(aLeftRope size + aRightRope size < self combineLength)
		ifTrue: [ ^ self collect: aLeftRope and: aRightRope ].

	(aLeftRope isConcatenation not
		and: [ aRightRope isConcatenation
			and: [ (aLeftRope size + aRightRope left size < self combineLength) ] ])
		ifTrue: [ 
			^ self rebalance: (self concatenationRope
				left: (self collect: aLeftRope and: aRightRope left)
				right: aRightRope right) ].
	
	(aRightRope isConcatenation not
		and: [ aLeftRope isConcatenation
			and: [ aRightRope size + aLeftRope right size < self combineLength ] ])
		ifTrue: [ ^ self rebalance: (self concatenationRope
			left: aLeftRope left
			right: (self collect: aLeftRope right and: aRightRope) ) ].
		
	^ self rebalance: (self concatenationRope left: aLeftRope right: aRightRope)
]

{ #category : #'rope types' }
SpRope class >> concatenationRope [
	^ SpConcatenationRope
]

{ #category : #accessing }
SpRope class >> fibonacci [
	^ fibonacci ifNil: [ fibonacci := { 0. 1. 1. 2. 3. 5. 8. 13. 21. 34. 55. 89. 144. 233. 377. 610. 987. 1597. 2584. 4181. 6765. 10946. 17711. 28657. 46368. 75025. 121393. 196418. 317811. 514229. 832040. 1346269. 2178309. 3524578. 5702887. 9227465. 14930352. 24157817. 39088169. 63245986. 102334155. 165580141. 267914296. 433494437. 701408733. 1134903170. 1836311903. 2971215073. 4807526976. 7778742049. 12586269025. 20365011074. 32951280099. 53316291173. 86267571272. 139583862445. 225851433717. 365435296162. 591286729879. 956722026041. 1548008755920. 2504730781961. 4052739537881. 6557470319842. 10610209857723. 17167680177565. 27777890035288. 44945570212853. 72723460248141. 117669030460994. 190392490709135. 308061521170129. 498454011879264. 806515533049393. 1304969544928657. 2111485077978050. 3416454622906707. 5527939700884757. 8944394323791464. 14472334024676221. 23416728348467685. 37889062373143906. 61305790721611591. 99194853094755497. 160500643816367088. 259695496911122585. 420196140727489673. 679891637638612258. 1100087778366101931. 1779979416004714189. 2880067194370816120. 4660046610375530309. 7540113804746346429} ]
]

{ #category : #'instance creation' }
SpRope class >> from: anObjectOrCollection [
	^ anObjectOrCollection isCollection
		ifTrue: [ self fromCollection: anObjectOrCollection ]
		ifFalse: [ self fromItem: anObjectOrCollection ]
]

{ #category : #'instance creation' }
SpRope class >> fromCollection: aCollection [
	^ SpCollectionRope collection: aCollection
]

{ #category : #'instance creation' }
SpRope class >> fromFile: aFile [
	^ SpFileReferenceRope file: aFile
]

{ #category : #'instance creation' }
SpRope class >> fromItem: anObject [
	^ SpItemRope item: anObject
]

{ #category : #'rope types' }
SpRope class >> itemRope [
	^ SpItemRope
]

{ #category : #accessing }
SpRope class >> maxDepth [
	^ 96
]

{ #category : #rope }
SpRope class >> merge: aCollectionOfRopes from: aStart to: anEnd [
	|size|
	size := anEnd - aStart + 1.
	^ size = 1
		ifTrue: [ aCollectionOfRopes at: aStart ]
		ifFalse: [ size = 2
			ifTrue: [ self concatenationRope
				left: (aCollectionOfRopes at: aStart)
				right: (aCollectionOfRopes at: anEnd) ]
			ifFalse: [
				| middle |
				middle := aStart + (size / 2) floor.
				self concatenationRope
					left: (self merge: aCollectionOfRopes from: aStart to: middle )
					right: (self merge: aCollectionOfRopes from: middle + 1 to: anEnd ) ] ]
]

{ #category : #rope }
SpRope class >> rebalance: aRope [
	| leafs examine grade |

	"No need to rebalance a rope that did not exceed max depth"
	(aRope depth <= self maxDepth or: [ aRope needsBalancing not ])
		ifTrue: [ ^ aRope ].
	
	leafs := OrderedCollection new: 24.
	examine := LinkedList new.
	grade := (aRope balanceGrade / aRope count) / 2.

	examine addLast: aRope.
	[ examine isEmpty ] whileFalse: [
		| rope |
		rope := examine removeFirst.
		(rope isConcatenation and: [ (rope balanceGrade / rope count) > grade ])
			ifTrue: [ 
				examine addFirst: rope right.
				examine addFirst: rope left. ]
			ifFalse: [ leafs add: rope ] ].
	^ self merge: leafs from: 1 to: leafs size
]

{ #category : #'rope types' }
SpRope class >> reverseRope [
	^ SpReverseRope
]

{ #category : #'rope types' }
SpRope class >> subRope [
	^ SpSubRope
]

{ #category : #accessing }
SpRope >> append: aRope [
	^ self class concatenate: self and: aRope
]

{ #category : #accessing }
SpRope >> at: anIndex [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpRope >> attributes [
	^ #()
]

{ #category : #accessing }
SpRope >> attributes: anAttributesCollection from: aStart to: anEnd [
	| rope |

	anAttributesCollection isEmpty
		ifTrue: [ ^ self ].

	(aStart = 1 and: [ anEnd = self size ])
		ifTrue: [ ^ self class attributeRope attributes: anAttributesCollection rope: self ].

	rope := self from: aStart to: anEnd.
	rope := self class attributeRope attributes: anAttributesCollection rope: rope.
	
	^ ((self from: 1 to: aStart - 1) append: rope) append: (self from: anEnd + 1 to: self size)
]

{ #category : #accessing }
SpRope >> balanceGrade [
	"Return a grade of balanciation. (left depth + right depth) / total depth"
	^ self subclassResponsibility
]

{ #category : #accessing }
SpRope >> count [
	^ self subclassResponsibility
]

{ #category : #accessing }
SpRope >> delete: aStart to: anEnd [
	aStart = anEnd
		ifTrue: [ ^ self ].

	^ (self from: 1 to: aStart) append: (self from: anEnd + 1 to: self size)
]

{ #category : #accessing }
SpRope >> depth [
	^ self subclassResponsibility
]

{ #category : #enumerating }
SpRope >> do: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
SpRope >> from: aStart to: anEnd [
	^ self subclassResponsibility
]

{ #category : #testing }
SpRope >> hasAttributes [
	^ false
]

{ #category : #accessing }
SpRope >> insert: aRope at: anIndex [
	"Insert aRope after anIndex"
	anIndex = 0
		ifTrue: [ ^ aRope append: self ].

	anIndex = self size
		ifTrue: [ ^ self append: aRope ].
		
	(anIndex < 0 or: [ anIndex > self size ])
		ifTrue: [ self error: 'Insert index ', anIndex asString, ' is out of bounds' ].

	^ ((self from: 1 to: anIndex) append: aRope) append: (self from: anIndex + 1 to: self size)
]

{ #category : #testing }
SpRope >> isConcatenation [
	^ false
]

{ #category : #testing }
SpRope >> isEmpty [
	"Return true if I don't contain any elements"
	<return: #Boolean>

	^ self size = 0
]

{ #category : #testing }
SpRope >> isNotEmpty [
	"Return true if I contain any elements"
	<return: #Boolean>

	^ self size > 0
]

{ #category : #enumerating }
SpRope >> iterator [
	^ self iterator: 1 to: self size
]

{ #category : #enumerating }
SpRope >> iterator: aStart to: anEnd [
	^ self subclassResponsibility
]

{ #category : #testing }
SpRope >> needsBalancing [
	^ (self balanceGrade / self count) > 0.4
]

{ #category : #printing }
SpRope >> printOn: aStream [
	(Array streamContents: [ :anArrayStream |
		self putOn: anArrayStream ]) do: [ :anElement |
			anElement isCharacter
				ifTrue: [ aStream nextPut: anElement ]
				ifFalse: [ aStream nextPutAll: anElement asString ] ]
]

{ #category : #streaming }
SpRope >> putOn: aStream [
	self putOn: aStream from: 1 to: self size
]

{ #category : #streaming }
SpRope >> putOn: aStream from: aStart to: anEnd [
	self subclassResponsibility
]

{ #category : #accessing }
SpRope >> rebalanced [
	^ self
]

{ #category : #accessing }
SpRope >> reversed [
	^ self class reverseRope rope: self
]

{ #category : #accessing }
SpRope >> size [
	^ self subclassResponsibility
]
