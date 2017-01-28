private
arcAround: aCenterPoint radius: aRadius startAngle: aStartAngle endAngle: anEndAngle
	| aCenter |
	
	aCenter := self toAbsolute: aCenterPoint.

	self
		primArcCenterX: aCenterPoint x
		centerY: aCenterPoint y
		radius: aRadius
		startAngle: aStartAngle
		endAngle: anEndAngle.
		
	endPoint := self currentPoint.
	lastControlPoint := nil