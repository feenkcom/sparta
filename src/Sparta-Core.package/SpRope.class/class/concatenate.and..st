rope
concatenate: aLeftRope and: aRightRope
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