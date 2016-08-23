private - ffi
primPushClipPath: aPath

	^ self ffiCall: #(void moz2d_draw_target_push_clip_path (
		MozCanvas canvas,
		MozPath aPath ))