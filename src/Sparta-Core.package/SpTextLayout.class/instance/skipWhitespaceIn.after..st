private
skipWhitespaceIn: aString after: aStart
	"Return an index of the first non-whitespace character in aString
	after aStart index"
	<return: #Number>

	|index char |
	index := aStart.
	char := aString at: index.
	[ index < aString size
		and: [ self isWhitespace: char ] ] whileTrue: [ 
		index := index + 1.
		char := aString at: index ].
	^ index