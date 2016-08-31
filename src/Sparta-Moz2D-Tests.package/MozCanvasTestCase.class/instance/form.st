accessing
form
	^ form ifNil: [ form := canvas asForm ]