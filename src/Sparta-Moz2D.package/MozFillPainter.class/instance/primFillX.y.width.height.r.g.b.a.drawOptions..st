private - ffi
primFillX: x y: y width: width height: height r: r g: g b: b a: a drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_fill_rect_color (
		DrawTarget canvas,
		float x,
		float y,
		float width,
		float height,
		float r,
		float g,
		float b,
		float a,
		DrawOptions aMoz2DDrawOptions ) )