accessing
yChannelGreen
	"Indicates which channel from ‘secondSource’ to use to displace the pixels in ‘source’ along the y-axis.
	If attribute ‘yChannel*’ is not specified, then the effect is as if a value of A were specified. "
	self
		primSetAttributeEnum: MozDisplacementMapFilterColorChannel COLOR_CHANNEL_G
		index: MozDisplacementMapFilterAtts ATT_DISPLACEMENT_MAP_Y_CHANNEL