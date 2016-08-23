builders
paintProvider
	^ paintProvider ifNil: [ paintProvider := MozPaintProvider new ]