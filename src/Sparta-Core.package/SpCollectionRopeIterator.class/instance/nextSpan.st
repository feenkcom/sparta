accessing
nextSpan
	| run |
	run := rope from: position to: end.
	position := end + 1.
	^ run