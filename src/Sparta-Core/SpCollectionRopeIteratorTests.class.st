Class {
	#name : #SpCollectionRopeIteratorTests,
	#superclass : #TestCase,
	#category : 'Sparta-Core-Text-Rope-Tests'
}

{ #category : #tests }
SpCollectionRopeIteratorTests >> testIteratorSegment1 [
	| rope iterator segment |

	rope := SpCollectionRope collection: #(1 2 3 4 5 0).
	iterator := rope iterator: 1 to: rope size.

	self assert: iterator position equals: 1.
	segment := iterator nextSegment: [ :each | each = 1 ].
	
	self assert: segment size equals: 1.
	self assert: (segment at: 1) equals: 1.
	
	self assert: iterator position equals: 2.
]

{ #category : #tests }
SpCollectionRopeIteratorTests >> testIteratorSegmentLast [
	| rope iterator segment |

	rope := SpCollectionRope collection: #(1 2 0).
	iterator := rope iterator: 1 to: rope size.

	self assert: iterator position equals: 1.

	segment := iterator nextSegment: [ :each | each = 0 ].
		
	self assert: segment size equals: 2.
	self assert: (segment at: 1) equals: 1.
	self assert: (segment at: 2) equals: 2.

	self assert: iterator hasNext not.
	self assert: iterator position equals: 4.
]

{ #category : #tests }
SpCollectionRopeIteratorTests >> testIteratorSegmentNotFound [
	| rope iterator segment |

	rope := SpCollectionRope collection: #(1 2 3).
	iterator := rope iterator: 1 to: rope size.

	self assert: iterator position equals: 1.

	segment := iterator nextSegment: [ :each | each = 0 ].

	self assert: segment size equals: 3.
	self assert: (segment at: 1) equals: 1.
	self assert: (segment at: 2) equals: 2.
	self assert: (segment at: 3) equals: 3.

	self assert: iterator hasNext not.
	self assert: iterator position equals: 4.
]

{ #category : #tests }
SpCollectionRopeIteratorTests >> testIteratorSegmentSingle [
	| rope iterator segment |

	rope := SpCollectionRope collection: #(1).
	iterator := rope iterator: 1 to: rope size.

	self assert: iterator position equals: 1.
	segment := iterator nextSegment: [ :each | each = 1 ].
	
	self assert: segment size equals: 1.
	self assert: (segment at: 1) equals: 1.
	
	self assert: iterator hasNext not.
	self assert: iterator position equals: 2.
]
