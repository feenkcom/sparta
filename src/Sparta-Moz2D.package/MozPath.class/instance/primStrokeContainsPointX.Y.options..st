private - ffi
primStrokeContainsPointX: aX Y: aY options: aStrokeOptions

	^ self ffiCall: #(bool moz2d_path_stroke_contains_point(self, float aX, float aY, MozStrokeOptions aStrokeOptions))