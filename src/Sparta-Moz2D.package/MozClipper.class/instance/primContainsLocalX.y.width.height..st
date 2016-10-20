private - ffi
primContainsLocalX: x y: y width: width height: height

	^ self ffiCall: #(bool moz2d_draw_target_clipping_is_in_local (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height ) )