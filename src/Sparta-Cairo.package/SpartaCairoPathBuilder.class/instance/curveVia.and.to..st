path commands
curveVia: cp1 and: cp2 to: aPoint
	|  pt1 |

	pt1 := self toAbsolute: cp1.
	lastControlPoint := self toAbsolute: cp2.
	endPoint := self toAbsolute: aPoint.

	self primCurveViaX: pt1 x Y: pt1 y viaX: lastControlPoint x Y: lastControlPoint y toX: endPoint x Y: endPoint y