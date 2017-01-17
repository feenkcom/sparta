dispatch
sourceCanvas: aSpartaCanvas

	"Canvases are ref counted, so no need to strong refer them"
	self primSetInputCanvas: aSpartaCanvas index: MozFilterInputs INPUT