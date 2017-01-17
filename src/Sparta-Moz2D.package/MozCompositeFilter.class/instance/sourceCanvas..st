dispatch
sourceCanvas: aSpartaCanvas

	"Canvases are ref counted, so no need to strong refer them"
	self primSetInputCanvas: aSpartaCanvas intIndex: self size.

	"increase counter by one"
	count := count + 1