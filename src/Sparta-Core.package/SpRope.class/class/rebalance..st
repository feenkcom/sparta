rope
rebalance: aRope
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