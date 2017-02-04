stream access
nextCharacter
	| aWord |
	
	aWord := textRun buffer at: index.
	index := index + 1.
	^ aWord