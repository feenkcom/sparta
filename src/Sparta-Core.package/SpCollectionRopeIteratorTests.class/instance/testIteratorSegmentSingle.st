tests
testIteratorSegmentSingle
	| rope iterator segment |

	rope := SpCollectionRope collection: #(1).
	iterator := rope iterator: 1 to: rope size.

	self assert: iterator position equals: 1.
	segment := iterator nextSegment: [ :each | each = 1 ].
	
	self assert: segment size equals: 1.
	self assert: (segment at: 1) equals: 1.
	
	self assert: iterator hasNext not.
	self assert: iterator position equals: 2.