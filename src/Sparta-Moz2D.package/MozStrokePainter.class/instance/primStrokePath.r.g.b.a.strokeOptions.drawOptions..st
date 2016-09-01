private
primStrokePath: aMoz2DPath r: r g: g b: b a: a strokeOptions: aMoz2DStrokeOptions drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_stroke_path_color (
		MozCanvas canvas,
		MozPath aMoz2DPath,
		float r,
		float g,
		float b,
		float a,
		MozStrokeOptions aMoz2DStrokeOptions,
		MozDrawOptions aMoz2DDrawOptions ) )