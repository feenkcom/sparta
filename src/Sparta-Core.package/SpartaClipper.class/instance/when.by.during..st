clipping
when: aWhenBlock by: aPathBlock during: aBlock
	"Clip canvas by a given path only if when block evaluates to true"

	aWhenBlock value
		ifTrue: [ self by: aPathBlock value during: aBlock ]
		ifFalse: [ aBlock value ]