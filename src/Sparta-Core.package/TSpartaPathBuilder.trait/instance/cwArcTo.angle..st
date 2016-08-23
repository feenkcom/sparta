path commands
cwArcTo: aPoint angle: aFloatAngleInRadians
	"Add a clockwise arc segment, starting from current path endpoint and
	ending at aPoint. Angle should be specified in radians."

	self arcTo: aPoint angle: aFloatAngleInRadians cw: true