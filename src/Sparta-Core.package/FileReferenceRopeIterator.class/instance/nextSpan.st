accessing
nextSpan
	| run |
	position := position + 1.
	run := rope from: position to: end.
	position := end.
	^ run