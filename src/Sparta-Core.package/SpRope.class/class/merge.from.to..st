rope
merge: aCollectionOfRopes from: aStart to: anEnd
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