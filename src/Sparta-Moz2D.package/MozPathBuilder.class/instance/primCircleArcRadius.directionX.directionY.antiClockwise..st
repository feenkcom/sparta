private - ffi
primCircleArcRadius: radius directionX: dirX directionY: dirY antiClockwise: anAntiClockwise

	^ self ffiCall: #(void moz2d_path_sink_circle_arc_to(self, float radius, int dirX, int dirY, bool anAntiClockwise))