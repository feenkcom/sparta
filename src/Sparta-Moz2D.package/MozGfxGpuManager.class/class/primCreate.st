private - ffi
primCreate

	^ self ffiCall: #(MozGfxGpuManager moz_gpu_manager_create())