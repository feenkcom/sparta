accessing
reset
	super reset.
	
	language := self defaultLanguage.
	size := self defaultSize.
	self stretchReset.
	self weightReset.
	self styleReset