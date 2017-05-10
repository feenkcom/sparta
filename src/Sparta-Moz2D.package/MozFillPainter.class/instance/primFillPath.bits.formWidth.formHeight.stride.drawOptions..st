private - ffi
primFillPath: aMozPath bits: aData formWidth: aFormWidth formHeight: aFormHeight stride: aStride drawOptions: aMozDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_fill_path_form (
		MozCanvas canvas,
		MozPath aMozPath,
		MozDrawOptions aMozDrawOptions,
		void* aData,
		int32 aFormWidth,
		int32 aFormHeight,
		int32 aStride) )