private
restoreDrawOptions

	"draw options are not set, no need to restore them"
	drawOptions
		ifNil: [ ^ self ].
		
	self
		primSetAntialias: canvas defaultDrawOptions antialias;
		primSetOperator: canvas defaultDrawOptions operator