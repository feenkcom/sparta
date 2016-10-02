rope
collect: aLeftRope and: aRightRope
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