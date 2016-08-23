drawing
draw
	"Primitive call"

	destinationPoint ifNil: [ destinationPoint := sourceRectangle origin ].
	self
		primDrawFilter: filter
		sourceRectangle: (MozNativeRect fromRectangle: sourceRectangle)
		destX: destinationPoint x
		destY: destinationPoint y
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])