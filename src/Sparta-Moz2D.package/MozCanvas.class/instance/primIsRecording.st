private - ffi - testing
primIsRecording

	^ self ffiCall: #(bool moz2d_draw_target_is_recording ( self ) )