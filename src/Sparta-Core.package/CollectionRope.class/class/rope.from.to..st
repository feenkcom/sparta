instance creation
rope: aLeftRope from: aStart to: anEnd
	| length array index |
	length := anEnd - aStart + 1.
	array := Array new: length.
	index := 1.
	aLeftRope do: [ :item | array at: index put: item. index := index + 1 ].
	^ self collection: array