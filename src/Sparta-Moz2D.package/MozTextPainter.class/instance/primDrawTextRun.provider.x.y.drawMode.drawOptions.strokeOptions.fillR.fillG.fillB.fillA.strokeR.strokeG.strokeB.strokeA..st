private - ffi
primDrawTextRun: aTextRun provider: aProvider x: x y: y drawMode: aDrawMode drawOptions: aDrawOptions strokeOptions: aStrokeOptions fillR: fillR fillG: fillG fillB: fillB fillA: fillA strokeR: strokeR strokeG: strokeG strokeB: strokeB strokeA: strokeA
	
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