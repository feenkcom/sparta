private - ffi
primContainsPointX: aX Y: aY

	^ self ffiCall: #(bool moz2d_path_contains_point(self, float aX, float aY))