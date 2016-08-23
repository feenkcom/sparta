geometry
localBounds
	|externalRectangle|
	externalRectangle := MozNativeRect new.
	self primGetClipLocal: externalRectangle.
	^ externalRectangle asRectangle