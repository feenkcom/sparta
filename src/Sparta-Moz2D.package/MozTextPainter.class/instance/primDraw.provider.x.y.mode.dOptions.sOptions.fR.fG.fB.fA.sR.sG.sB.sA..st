private - ffi
primDraw: aTextRun provider: aProvider x: x y: y mode: aDrawMode dOptions: aDrawOptions sOptions: aStrokeOptions fR: fillR fG: fillG fB: fillB fA: fillA sR: strokeR sG: strokeG sB: strokeB sA: strokeA
	
	self ffiCall: #(void moz2d_text_run_draw_color (
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
		float fillR,
		float fillG,
		float fillB,
		float fillA,
		float strokeR,
		float strokeG,
		float strokeB,
		float strokeA ) )