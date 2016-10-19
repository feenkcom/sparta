accessing
nextSpan
	| run attributes |
	attributes := self nextAttributes.
	run := subIterator nextSpan.
	^ run attributes: attributes from: 1 to: run size.