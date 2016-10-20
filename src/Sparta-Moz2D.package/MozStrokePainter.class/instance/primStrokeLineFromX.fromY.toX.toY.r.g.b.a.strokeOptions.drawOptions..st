private
primStrokeLineFromX: fromX fromY: fromY toX: toX toY: toY r: r g: g b: b a: a strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_stroke_line_color (
		MozCanvas canvas,
		float fromX,
		float fromY,
		float toX,
		float toY,
		float r,
		float g,
		float b,
		float a,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )