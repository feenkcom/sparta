accessing
size
	"Return a number of glyphs that build this text.
	Note: in UTF encoding a character may be represented by 1-4 glyphs depending on char's code"
	<return: #Number>

	^ self length 	"Must be the same as `self primGetLength`!"