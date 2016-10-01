rope
collect: aLeftRope and: aRightRope
	| equalAttributes |
	equalAttributes := aLeftRope attributes = aRightRope attributes.
	equalAttributes ifTrue: [
		| collectionRope |
		collectionRope := self collectionRope from: aLeftRope and: aRightRope.
		^ aLeftRope hasAttributes
			ifTrue: [ self attributeRope attributes: aLeftRope attributes rope: collectionRope ]
			ifFalse: [ collectionRope ] ].
	
	^ self concatenationRope left: aLeftRope right: aRightRope