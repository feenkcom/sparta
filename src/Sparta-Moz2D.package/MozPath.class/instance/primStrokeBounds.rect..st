private -ffi
primStrokeBounds: aStrokeOptions rect: aRect

	^ self ffiCall: #(void moz2d_path_get_stroked_bounds(self, MozStrokeOptions aStrokeOptions, MozNativeRect aRect))