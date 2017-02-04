private
next16BitWord
	| aWord |
	
	aWord := self peek16BitWord.

	(aWord < 16rD800 or: [ aWord > 16rDBFF ])
		ifTrue: [ index := index + 1 ]
		ifFalse: [ offset := offset + 2 ].
	
	^ aWord