private
fill
	"Perform a fill operation according to global alpha property set in drawOptions"

	(drawOptions isNotNil and: [ drawOptions alpha ~= 1.0 ])
		"we have a custom global alpha mask"
		ifTrue: [ 
			self primSave.
			"restrict painted region to rectangle"
			self primClip.
			self primPaintAlpha: drawOptions alpha.
			self primRestore ]
		"fill normally"
		ifFalse: [ self primFill ].
	
	"do not forget to restore source to default"
	self primSetSourceR: 0.0 G: 0.0 B: 0.0 A: 1.0