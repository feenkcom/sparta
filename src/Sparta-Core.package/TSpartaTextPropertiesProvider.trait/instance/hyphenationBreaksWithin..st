accessing
hyphenationBreaksWithin: anInterval
	"Detect hyphenation break opportunities in the given range.
	Breaks not at cluster boundaries will be ignored."
	<return: #Array>
	|prevChar|
	prevChar := nil.
	^ anInterval collect: [ :index |
		|char result |
		char := (self string at: index).
		result := char = Character space or: [ prevChar = $- ].
		prevChar := char.
		result ]