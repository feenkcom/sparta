private - ffi
primArcOriginX: originX originY: originY radius: aRadius startAngle: aStartAngle endAngle: anEndAngle antiClockwise: anAntiClockwise absolute: isAbsolute

	^ self ffiCall: #(void moz2d_path_sink_arc (
		self,
		float originX,
		float originY,
		float aRadius,
		float aStartAngle,
		float anEndAngle,
		bool anAntiClockwise,
		bool isAbsolute ) )