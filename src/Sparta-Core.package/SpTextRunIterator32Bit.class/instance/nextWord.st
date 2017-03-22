stream access
nextWord
	| aWord |

	aWord := self peek16BitWord.
	index := index + 1.
	^ (aWord < 16rD800 or: [ aWord > 16rDBFF ])
		ifTrue: [ aWord ]
		ifFalse: [ 
			| aLead aTrail aCode |
			aLead := aWord.
			aTrail := self peek16BitWord.
			aCode := (aLead - 16rD800) * 16r400 + (aTrail - 16rDC00).
			"increase offset by 2 bits"
			offset := offset + 2.
			16r10000 + aCode ]