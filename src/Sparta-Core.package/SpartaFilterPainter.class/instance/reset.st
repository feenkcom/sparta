initialize-release
reset
	"On reset set all inst.vars to nil to allow them
	be garbage collected"
	super reset.
	
	filter := nil.
	sourceRectangle := nil.
	destinationPoint := nil.
	drawOptions := nil.