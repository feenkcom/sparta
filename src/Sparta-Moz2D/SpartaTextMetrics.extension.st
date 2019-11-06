Extension { #name : #SpartaTextMetrics }

{ #category : #'*Sparta-Moz2D' }
SpartaTextMetrics >> mozInitializeFrom: aMozTextMetrics [
	"Initialize me from external structure"

	advance := aMozTextMetrics advanceWidth.
	left := aMozTextMetrics boundingBoxX.
	top := aMozTextMetrics boundingBoxY.
	width := aMozTextMetrics boundingBoxWidth.
	height := aMozTextMetrics boundingBoxHeight
]
