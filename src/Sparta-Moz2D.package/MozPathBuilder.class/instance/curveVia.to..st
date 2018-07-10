path commands
curveVia: aControlPoint to: anEndPoint

	self
		primQuadraticBezierX1: aControlPoint x
		Y1: aControlPoint y
		X2: anEndPoint x
		Y2: anEndPoint y
		absolute: self isAbsolute