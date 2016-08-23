geometry
globalBounds
	|externalRectangle|
	externalRectangle := MozNativeRect new.
	self primGetClipGlobal: externalRectangle.
	^ externalRectangle asRectangle