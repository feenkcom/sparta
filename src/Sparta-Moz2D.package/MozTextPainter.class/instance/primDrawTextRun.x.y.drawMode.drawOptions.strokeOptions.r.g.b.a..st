private - ffi
primDrawTextRun: aTextRun x: x y: y drawMode: aDrawMode drawOptions: aDrawOptions strokeOptions: aStrokeOptions r: r g: g b: b a: a

	^ self ffiCall: #(void moz2d_text_run_draw (
		MozCanvas canvas,
		MozTextRun aTextRun,
		float x,
		float y,
		int8 aDrawMode,
		MozDrawOptions aDrawOptions,
		MozStrokeOptions aStrokeOptions,
		float r,
		float g,
		float b,
		float a ) )