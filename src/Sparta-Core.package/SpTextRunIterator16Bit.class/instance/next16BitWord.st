private
next16BitWord
	| aWord |
	
	aWord := self peek16BitWord.
	index := index + 1.
	^ aWord