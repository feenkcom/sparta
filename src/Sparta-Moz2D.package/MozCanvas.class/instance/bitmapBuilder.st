builders
bitmapBuilder
	^ bitmapBuilder ifNil: [ bitmapBuilder := MozBitmapBuilder new ]