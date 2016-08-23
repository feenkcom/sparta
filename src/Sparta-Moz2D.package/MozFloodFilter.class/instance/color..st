accessing
color: aColor
	"The ‘color’ property indicates what color to use to flood the current filter primitive subregion."
	self
		primSetAttributeR: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha
		index: MozFloodFilterAtts ATT_FLOOD_COLOR