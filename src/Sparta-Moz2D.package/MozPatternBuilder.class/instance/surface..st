accessing
surface: aMozSurfacePaint
	| samplingX samplingY samplingWidth samplingHeight |

	self
		assert: [ aMozSurfacePaint source isNotNil ]
		description: [ 'Source must not be nil in Surface Paint!' ].
	
	aMozSurfacePaint samplingArea
		ifNil: [
			samplingX := 0.
			samplingY := 0.
			samplingWidth := 0.
			samplingHeight := 0 ]
		ifNotNil: [ :rect |
			samplingX := rect left.
			samplingY := rect top.
			samplingWidth := rect width.
			samplingHeight := rect height ].
	
	^ (self 
		primSurface: aMozSurfacePaint source
		X: samplingX
		Y: samplingY
		width: samplingWidth
		height: samplingHeight
		filter: aMozSurfacePaint samplingFilter
		extend: aMozSurfacePaint extendMode
		a11: aMozSurfacePaint transformation sx
		a12: aMozSurfacePaint transformation shy
		a21: aMozSurfacePaint transformation shx
		a22: aMozSurfacePaint transformation sy
		a31: aMozSurfacePaint transformation x
		a32: aMozSurfacePaint transformation y) autoRelease