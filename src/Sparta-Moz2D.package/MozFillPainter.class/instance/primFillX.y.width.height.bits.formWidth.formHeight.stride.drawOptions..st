private - ffi
primFillX: x y: y width: width height: height bits: aData formWidth: aFormWidth formHeight: aFormHeight stride: aStride drawOptions: aMoz2DDrawOptions
		
	^ self ffiCall: #( void moz2d_draw_target_fill_rectangle_form (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height,
		MozDrawOptions aMoz2DDrawOptions,
		void* aData,
		int32 aFormWidth,
		int32 aFormHeight,
		int32 aStride) )