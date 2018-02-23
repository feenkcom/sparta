geometry - testing
strokeContainsPoint: aPoint options: aStrokeOptions
	"Return true if a given point lies within this path as if it would be stroked with provided stroke options"
	<return: #Boolean>

	^ self primStrokeContainsPointX: aPoint x Y: aPoint y options: aStrokeOptions