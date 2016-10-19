accessing
nextSegment: aBlock
	"Return a segment of item for those aBlock answers false"
	| fromIndex lastSkip |
	self hasNext
		ifFalse: [ self error: 'reached end of rope' ].
	
	fromIndex := self position.
	
	"we skip all items that do not belong to segment"
	[ self hasNext and: [ lastSkip := (aBlock value: self next) not ] ] whileTrue.

	(self hasNext or: [ lastSkip ])
		ifFalse: [ ^ SpRope from: #() ].

	^ self rope from: fromIndex to: self position - 1