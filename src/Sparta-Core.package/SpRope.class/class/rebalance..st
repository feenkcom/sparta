rope
rebalance: aRope
	| leafs examine |

	"No need to rebalance a rope that did not exceed max depth"
	(aRope depth <= self maxDepth)
		ifTrue: [ ^ aRope ].

	leafs := OrderedCollection new: aRope size.
	examine := LinkedList new.
	
	examine addLast: aRope.

	[ examine isEmpty ] whileFalse: [
		| rope |
		rope := examine removeLast.
		rope isConcatenation
			ifTrue: [ 
				examine addLast: rope left.
				examine addLast: rope right ]
			ifFalse: [ leafs add: rope ] ].
		
	^ self merge: leafs from: 1 to: leafs size