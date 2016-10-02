accessing
next
	| item |
	item := rope collection at: position.
	position := position + 1.
	^ item