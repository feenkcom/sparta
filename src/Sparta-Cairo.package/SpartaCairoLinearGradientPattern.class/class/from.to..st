instance creation
from: aFromPoint to: aToPoint

	^ (self
		primCreateFromX: aFromPoint x
		fromY: aFromPoint y
		toX: aToPoint x
		toY: aToPoint y) autoRelease