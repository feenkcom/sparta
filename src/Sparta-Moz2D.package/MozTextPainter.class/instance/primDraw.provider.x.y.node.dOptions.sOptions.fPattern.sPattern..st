private - ffi
primDraw: aTextRun provider: aProvider x: x y: y node: aDrawMode dOptions: aDrawOptions sOptions: aStrokeOptions fPattern: aFillPattern sPattern: aStrokePattern
	
	self ffiCall: #(void moz2d_text_run_draw_pattern (
		MozCanvas canvas,
		MozTextRun aTextRun,
		uint32 start,
		uint32 end,
      MozTextPropertyProvider aProvider,
		double x,
		double y,
		int aDrawMode,
		MozDrawOptions aDrawOptions,
		MozStrokeOptions aStrokeOptions,
		MozNativePattern aFillPattern,
		MozNativePattern aStrokePattern ) )