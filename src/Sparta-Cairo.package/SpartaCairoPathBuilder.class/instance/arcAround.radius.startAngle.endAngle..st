private
arcAround: aCenterPoint radius: aRadius startAngle: aStartAngle endAngle: anEndAngle
	| aCenter |
	
	aCenter := self toAbsolute: aCenterPoint.

	self
		primArcCenterX: aCenter x
		centerY: aCenter y
		radius: aRadius
		startAngle: aStartAngle
		endAngle: anEndAngle.
		
	endPoint := self currentPoint.
	lastControlPoint := nil