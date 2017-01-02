*Sparta-Moz2D
mozInitializeFrom: aMozTextMetrics
	"Initialize me from external structure"

	advance := aMozTextMetrics advanceWidth.
	ascent := aMozTextMetrics ascent.
	descent := aMozTextMetrics descent.
	left := aMozTextMetrics boundingBoxX.
	top := aMozTextMetrics boundingBoxY.
	width := aMozTextMetrics boundingBoxWidth.
	height := aMozTextMetrics boundingBoxHeight