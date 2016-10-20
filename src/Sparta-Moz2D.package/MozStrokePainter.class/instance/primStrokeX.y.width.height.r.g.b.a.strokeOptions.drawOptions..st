private
primStrokeX: x y: y width: width height: height r: r g: g b: b a: a strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_stroke_rect_color (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height,
		float r,
		float g,
		float b,
		float a,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )