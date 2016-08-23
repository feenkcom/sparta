accessing
extent
	|intSize|
	intSize := MozNativeIntSize new.
	self primGetSize: intSize.
	^ intSize asPoint