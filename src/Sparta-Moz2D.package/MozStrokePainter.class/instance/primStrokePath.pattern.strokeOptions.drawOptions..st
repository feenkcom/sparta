private
primStrokePath: aMozPath pattern: aMozPattern strokeOptions: aMozStrokeOptions drawOptions: aMozDrawOptions

	^ self ffiCall: #( void moz2d_draw_target_stroke_path (
		MozCanvas canvas,
		MozPath aMozPath,
		MozNativePattern aMozPattern,
		MozStrokeOptions aMozStrokeOptions,
		MozDrawOptions aMozDrawOptions ) )