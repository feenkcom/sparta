geometry
strokedBoundsOn: aSpartaCanvas with: aStrokeOptions
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>
	| strokePainter bounds |
	
	strokePainter := aSpartaCanvas stroke.
	strokePainter strokeOptions: aStrokeOptions.

	bounds := (0@0 extent: 0@0).
	
	[ | originX originY cornerX cornerY |

	strokePainter applyStrokeOptions.
	originX := FFIExternalArray externalNewType: 'double' size: 1.
	originY := FFIExternalArray externalNewType: 'double' size: 1.
	cornerX := FFIExternalArray externalNewType: 'double' size: 1.
	cornerY := FFIExternalArray externalNewType: 'double' size: 1.
	
	strokePainter
		primNewPath;
		primAppendPath: self.
	
	self
		primStrokeExtent: aSpartaCanvas
		originX: originX getHandle
		originY: originY getHandle
		cornerX: cornerX getHandle
		cornerY: cornerY getHandle.

	bounds := (originX at: 1)@(originY at: 1) corner: (cornerX at: 1)@(cornerY at: 1).
	
	originX free.
	originY free.
	cornerX free.
	cornerY free.
	
	] ensure: [
		strokePainter primNewPath.
		strokePainter restoreStrokeOptions ].
	
	^ bounds