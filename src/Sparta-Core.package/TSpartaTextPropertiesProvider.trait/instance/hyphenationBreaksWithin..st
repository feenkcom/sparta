accessing
hyphenationBreaksWithin: anInterval
	"Detect hyphenation break opportunities in the given range.
	Breaks not at cluster boundaries will be ignored."
	<return: #Array>

	^ anInterval collect: [ :index | (self string at: index) = Character cr ]