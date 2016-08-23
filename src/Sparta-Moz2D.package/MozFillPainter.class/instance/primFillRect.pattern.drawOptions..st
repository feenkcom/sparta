private - ffi
primFillRect: aMoz2DRectangle pattern: aMoz2DPattern drawOptions: aMoz2DDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_fill_rect (
		DrawTarget canvas,
		MozNativeRect aMoz2DRectangle,
		MozNativePattern aMoz2DPattern,
		DrawOptions aMoz2DDrawOptions ) )