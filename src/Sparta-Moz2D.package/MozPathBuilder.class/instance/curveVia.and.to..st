path commands
curveVia: cp1 and: cp2 to: aPoint

	self
		primBezierX1: cp1 x
		Y1: cp1 y
		X2: cp2 x
		Y2: cp2 y
		X3: aPoint x
		Y3: aPoint y
		absolute: self isAbsolute