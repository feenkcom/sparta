accessing
extent
	|externalSize|
	externalSize := MozNativeIntSize new.
	self primGetSize: externalSize.
	^ externalSize asPoint