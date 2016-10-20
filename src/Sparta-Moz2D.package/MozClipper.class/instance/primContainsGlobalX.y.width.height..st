private - ffi
primContainsGlobalX: x y: y width: width height: height

	^ self ffiCall: #(bool moz2d_draw_target_clipping_is_in_global (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height ) )