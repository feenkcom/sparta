private
primStrokePath: aMozPath r: r g: g b: b a: a strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_stroke_path_color (
		MozCanvas canvas,
		MozPath aMozPath,
		float r,
		float g,
		float b,
		float a,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )