private
primStrokeRect: aMoz2DRectangle pattern: aMoz2DPattern strokeOptions: aMoz2DStrokeOptions drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_stroke_rect (
		MozCanvas canvas,
		MozNativeRect aMoz2DRectangle,
		MozNativePattern aMoz2DPattern,
		MozStrokeOptions aMoz2DStrokeOptions,
		MozDrawOptions aMoz2DDrawOptions ) )