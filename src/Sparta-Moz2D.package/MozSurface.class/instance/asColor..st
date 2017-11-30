converting
asColor: aColor
	"Transform all non transparent pixels to a given color"
	<return: #MozSurface>

	^ (self
		primToColorR: (aColor red * 255) rounded
		G: (aColor green * 255) rounded
		B: (aColor blue * 255) rounded
		A: (aColor alpha * 255) rounded)
			autoRelease