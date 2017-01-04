rectangle functions
merge: aRectangle 
	"Merge provided rectangle into me.
	aRectangle must not be nil"
	| useRcvr rOrigin rCorner minX maxX minY maxY |

	useRcvr := true.
	rOrigin := aRectangle topLeft.
	rCorner := aRectangle bottomRight.
	minX := rOrigin x < left
		ifTrue: 
			[ useRcvr := false.
			rOrigin x ]
		ifFalse: [ left ].
	maxX := rCorner x > right
		ifTrue: 
			[ useRcvr := false.
			rCorner x ]
		ifFalse: [ right ].
	minY := rOrigin y < top
		ifTrue: 
			[ useRcvr := false.
			rOrigin y ]
		ifFalse: [ top ].
	maxY := rCorner y > bottom
		ifTrue: 
			[ useRcvr := false.
			rCorner y ]
		ifFalse: [ bottom ].
	
	"no need to merge do nothing"
	useRcvr 
		ifTrue: [ ^ self ].
	
	left := minX.
	top := minY.
	right := maxX.
	bottom := maxY