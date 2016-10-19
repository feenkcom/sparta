instance creation
rope: aRope from: aStart to: anEnd
	| break |
	super rope: aRope from: aStart to: anEnd.
	traverse := LinkedList new.
	traverse addLast: aRope.
	currentRope := nil.

	break := false.
	[ traverse isEmpty or: [ break ] ] whileFalse: [
		currentRope := traverse removeLast.
		currentRope ~= aRope ifTrue: [
			currentIterator := currentRope iterator: 1 to: currentRope size ].
		currentRope isConcatenation ifTrue: [ 
			traverse addLast: currentRope right.
			traverse addLast: currentRope left ]
		ifFalse: [ break := true ] ].
	
	currentRope
		ifNil: [ self error: 'Terminal rope is not found!' ].
	
	currentPos := 0.
	position := 0.
	self moveForward: aStart