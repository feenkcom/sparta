private
peek16BitWord
	| aBuffer aFirst aSecond anIndex |
	aBuffer := textRun buffer.
	
	anIndex := (index - 1) * 2 + 1.
	aFirst := aBuffer byteAt: anIndex.
	aSecond := aBuffer byteAt: anIndex + 1.
	^ (aSecond << 8) + aFirst