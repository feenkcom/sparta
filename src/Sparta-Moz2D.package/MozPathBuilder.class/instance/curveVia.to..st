path commands
curveVia: cp1 to: aPoint

	self
		primQuadraticBezierX1: cp1 x
		Y1: cp1 y
		X2: aPoint x
		Y2: aPoint y
		absolute: self isAbsolute