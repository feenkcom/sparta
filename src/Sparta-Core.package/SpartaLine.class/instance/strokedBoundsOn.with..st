geometry
strokedBoundsOn: aSpartaCanvas with: aStrokeOptions
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>

	^ boundsCache
		strokedBounds: aStrokeOptions
		ifAbsentPut: [
			(aSpartaCanvas path
				moveTo: self from;
				lineTo: self to;
				build) strokedBoundsOn: aSpartaCanvas with: aStrokeOptions ]