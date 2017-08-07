accessing
length: aNumber
	"Set amount of glyphs starting from #start that should be measured.
	If length is greater than amoung of glyphs in text run, it will be measured until the end.
	Note: one character can be represented by 1 or 2 glyphs depending on encoding"
	
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Length can not be negative' ].
	
	length := aNumber