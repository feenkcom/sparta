accessing
nextRun
	| run attributes |
	attributes := self nextAttributes.
	run := subIterator nextRun.
	^ run attributes: attributes from: 1 to: run size.