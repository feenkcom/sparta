private - ffi
primCircleArcRadius: radius directionX: dirX directionY: dirY antiClockwise: anAntiClockwise

	^ self ffiCall: #(void moz2d_path_sink_circle_arc_to(self, float radius, int8 dirX, int8 dirY, bool anAntiClockwise))