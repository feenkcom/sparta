private
primStrokeRect: aMoz2DRectangle pattern: aMoz2DPattern strokeOptions: aMoz2DStrokeOptions drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_stroke_rect (
		DrawTarget canvas,
		MozNativeRect aMoz2DRectangle,
		MozNativePattern aMoz2DPattern,
		StrokeOptions aMoz2DStrokeOptions,
		DrawOptions aMoz2DDrawOptions ) )