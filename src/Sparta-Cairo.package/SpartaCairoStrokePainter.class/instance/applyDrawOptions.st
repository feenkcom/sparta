private
applyDrawOptions

	"draw options are not set, no need to apply them"
	drawOptions
		ifNil: [ ^ self ].
		
	self
		primSetAntialias: drawOptions antialias;
		primSetOperator: drawOptions operator