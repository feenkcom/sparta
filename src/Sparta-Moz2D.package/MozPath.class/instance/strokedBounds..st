geometry - accessing
strokedBounds: aStrokeOptions
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>
	| extRect |

	extRect := MozNativeRect new.
	self primStrokeBounds: aStrokeOptions rect: extRect.
	^ extRect asRectangle