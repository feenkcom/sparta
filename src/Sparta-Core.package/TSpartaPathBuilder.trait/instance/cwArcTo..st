path commands
cwArcTo: aPoint
	"Add a clockwise arc segment, starting from current path endpoint and
	ending at aPoint assuming that angle is Pi/2"

	self arcTo: aPoint angle: Float pi / 2 cw: true