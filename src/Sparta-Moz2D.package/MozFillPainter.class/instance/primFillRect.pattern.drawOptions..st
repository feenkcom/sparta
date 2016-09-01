private - ffi
primFillRect: aMoz2DRectangle pattern: aMoz2DPattern drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_fill_rect (
		MozCanvas canvas,
		MozNativeRect aMoz2DRectangle,
		MozNativePattern aMoz2DPattern,
		MozDrawOptions aMoz2DDrawOptions ) )