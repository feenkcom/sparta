private - ffi
primFillPathColor: aMozPath r: r g: g b: b a: a drawOptions: aMozDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_fill_path_color (
		MozCanvas canvas,
		MozPath aMozPath,
		float r,
		float g,
		float b,
		float a,
		MozDrawOptions aMozDrawOptions ) )