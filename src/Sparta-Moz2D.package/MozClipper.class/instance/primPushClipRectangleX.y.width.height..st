private - ffi
primPushClipRectangleX: x y: y width: width height: height

	^ self ffiCall: #(void moz2d_draw_target_push_clip_rectangle (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height ))