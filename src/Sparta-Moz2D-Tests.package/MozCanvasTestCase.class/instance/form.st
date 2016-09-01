accessing
form
	^ form ifNil: [ form := Form extent: canvas extent depth: 32 fromArray: canvas pixels offset: 0@0 ]