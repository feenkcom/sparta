geometry - testing
strokeContainsPoint: aPoint options: aStrokeOptions on: aSpartaCairoCanvas
	"Return true if a given point lies within this path as if it would be stroked with provided stroke options"
	<return: #Boolean>
	| strokePainter containtsPoint |
	
	strokePainter := aSpartaCairoCanvas stroke.
	strokePainter strokeOptions: aStrokeOptions.
	
	containtsPoint := false.
	
	[

	strokePainter applyStrokeOptions.
	self setOnCanvas: aSpartaCairoCanvas.

	containtsPoint := self
		primInStrokeX: aPoint x
		Y: aPoint y
		on: aSpartaCairoCanvas.
	
	] ensure: [
		strokePainter primNewPath.
		strokePainter restoreStrokeOptions ].
	
	^ containtsPoint