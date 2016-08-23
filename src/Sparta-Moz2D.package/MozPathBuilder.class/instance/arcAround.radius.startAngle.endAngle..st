private
arcAround: aCenterPoint radius: aRadius startAngle: aStartAngle endAngle: anEndAngle
	self
		primArcOriginX: aCenterPoint x
		originY: aCenterPoint y
		radius: aRadius
		startAngle: aStartAngle
		endAngle: anEndAngle
		antiClockwise: false
		absolute: self isAbsolute