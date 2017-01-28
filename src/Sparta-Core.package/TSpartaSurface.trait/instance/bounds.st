accessing
bounds
	"Return my bounds in device (global) space coordinate system.
	Origin is always set to 0@0, while extent equals to my actual extent.
	bounds can not be nil"
	<return: #Rectangle>

	^ 0@0 extent: self extent