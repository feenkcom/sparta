dispatch
setOnCanvas: aSpartaCairoCanvas
	self
		primSetFillRule: self fillRule on: aSpartaCairoCanvas;
		primNewPathOn: aSpartaCairoCanvas;
		primAppendPath: self on: aSpartaCairoCanvas.