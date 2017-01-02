initialization
initialize
	super initialize.
	
	session := Smalltalk session.

	self enableTextMetrics.
	self enableFontMetrics.
	self enablePropertyProvider.
	self recordLastBreak.
	self recordUsedHyphenation.
	self ignoreTrimmedWhitespace.

	self autoRelease