private
primStrokePath: aMoz2DPath pattern: aMoz2DPattern strokeOptions: aMoz2DStrokeOptions drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_stroke_path (
		DrawTarget canvas,
		MozPath aMoz2DPath,
		MozNativePattern aMoz2DPattern,
		StrokeOptions aMoz2DStrokeOptions,
		DrawOptions aMoz2DDrawOptions ) )