instance creation
rope: aRope from: aStart to: anEnd
	super rope: aRope from: aStart to: anEnd.
	position := aStart - 1.
	readStream := aRope stream.
	readStream position: position