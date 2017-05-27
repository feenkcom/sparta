layer
when: aWhenBlock during: aBlock
	"Create a new virtual layout only if when block evaluates to true"

	aWhenBlock value
		ifTrue: [ self during: aBlock ]
		ifFalse: [ aBlock value ]