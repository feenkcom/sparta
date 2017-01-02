finalization
finalize
	
	self finalizeLastBreak.
	self finalizeTrimWhitespace.
	self finalizeUsedHyphenation.
	self finalizeTextMetrics.
	self finalizeFontMetrics.
	self finalizePropertyProvider.
	
	session := nil