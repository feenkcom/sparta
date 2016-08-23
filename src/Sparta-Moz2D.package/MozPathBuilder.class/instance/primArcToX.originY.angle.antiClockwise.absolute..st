private - ffi
primArcToX: endX originY: endY angle: anAngle antiClockwise: anAntiClockwise absolute: isAbsolute

	^ self ffiCall: #(void moz2d_path_sink_arc_to_angle(
		self,
		float endX,
		float endY,
		float anAngle,
		bool anAntiClockwise,
		bool isAbsolute))