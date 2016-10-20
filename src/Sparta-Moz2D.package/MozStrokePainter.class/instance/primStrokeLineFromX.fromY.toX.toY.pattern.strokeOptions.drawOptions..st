private
primStrokeLineFromX: fromX fromY: fromY toX: toX toY: toY pattern: aMozPattern strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_stroke_line (
		MozCanvas canvas,
		float fromX,
		float fromY,
		float toX,
		float toY,
		MozNativePattern aMozPattern,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )