instance creation
innerCenter: anInnerCenter innerRadius: anInnerRadius outerCenter: anOuterCenter outerRadius: anOuterRadius

	^ (self
		primCreateInnerX: anInnerCenter x
		innerY: anInnerCenter y
		innerRadius: anInnerRadius
		outerX: anOuterCenter x
		outerY: anOuterCenter y
		outerRadius: anOuterRadius) autoRelease