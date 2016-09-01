private - ffi
primFillPath: aMozPath pattern: aMozPattern drawOptions: aMozDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_fill_path (
		MozCanvas canvas,
		MozPath aMozPath,
		MozNativePattern aMozPattern,
		MozDrawOptions aMozDrawOptions ) )