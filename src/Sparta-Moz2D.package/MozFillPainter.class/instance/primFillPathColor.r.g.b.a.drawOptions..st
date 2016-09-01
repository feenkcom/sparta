private - ffi
primFillPathColor: aMoz2DPath r: r g: g b: b a: a drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_fill_path_color (
		MozCanvas canvas,
		MozPath aMoz2DPath,
		float r,
		float g,
		float b,
		float a,
		MozDrawOptions aMoz2DDrawOptions ) )