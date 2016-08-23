builders
textPainter
	^ textPainter ifNil: [ textPainter := MozTextPainter new ]