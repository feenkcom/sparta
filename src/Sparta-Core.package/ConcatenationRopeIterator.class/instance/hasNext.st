testing
hasNext
	^ ((currentPos <= currentRope size) or: [ traverse isNotEmpty ])
		and: [ position <= end ]