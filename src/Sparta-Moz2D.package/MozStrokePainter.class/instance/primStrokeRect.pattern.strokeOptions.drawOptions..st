private
primStrokeRect: aMozRectangle pattern: aMozPattern strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_stroke_rect (
		MozCanvas canvas,
		MozNativeRect aMozRectangle,
		MozNativePattern aMozPattern,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )