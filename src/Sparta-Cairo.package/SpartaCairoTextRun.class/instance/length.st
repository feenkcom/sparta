accessing
length
	"Return amount of glyphs that build this text run.
	Note: in UTF encoding a character may be represented by 1-4 glyphs depending on char's code,
	it is recommended to use #iterator for text run enumeration"
	<return: #Number>
	
	^ length