iteration
moveForward: aNumber
	| remaining |
	position := position + aNumber.
	remaining := aNumber.
	
	[ remaining > 0 ] whileTrue: [ 
		| available break |
		available := currentRope size - currentPos.
		(remaining <= available) ifTrue: [ 
			currentPos := currentPos + remaining.
			"currentIterator skip: remaining - 1."
			^ self ].
		remaining := remaining - available.
		traverse isEmpty ifTrue: [ 
			position := position - remaining + 1.
			^ self ].

		break := false.
		[ traverse isEmpty or: [ break ] ] whileFalse: [ 
			currentRope := traverse removeLast.
			currentIterator := currentRope iterator: 1 to: currentRope size.
			currentRope isConcatenation ifTrue: [ 
				traverse addLast: currentRope right.
				traverse addLast: currentRope left ]
			ifFalse: [
				currentPos := 0.
				break := true ] ] ]