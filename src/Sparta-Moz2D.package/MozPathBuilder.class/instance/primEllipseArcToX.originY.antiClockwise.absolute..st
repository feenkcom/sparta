private - ffi
primEllipseArcToX: endX originY: endY antiClockwise: anAntiClockwise absolute: isAbsolute

	^ self ffiCall: #(void moz2d_path_sink_ellipse_arc_to (
		self,
		float endX,
		float endY,
		bool anAntiClockwise,
		bool isAbsolute))