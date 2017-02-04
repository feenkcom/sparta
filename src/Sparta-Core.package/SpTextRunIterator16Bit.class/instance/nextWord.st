stream access
nextWord
	| aWord |

	aWord := self peek16BitWord.
	index := index + 1.
	^ aWord