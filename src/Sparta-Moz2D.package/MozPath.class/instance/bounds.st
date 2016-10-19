geometry
bounds
	"Return the bounds of this path.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>
	
	^ self strokedBounds: (MozStrokeOptions new width: 0)