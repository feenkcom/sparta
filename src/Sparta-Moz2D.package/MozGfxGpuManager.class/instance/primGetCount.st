private - ffi
primGetCount

	^ self ffiCall: #(	size_t moz_gpu_manager_gpu_count ( self ) )