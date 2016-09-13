private - ffi
primGetLength

	^ self ffiCall: #(uint32 moz2d_text_run_get_length(self))