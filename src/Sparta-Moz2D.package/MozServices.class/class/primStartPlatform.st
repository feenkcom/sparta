private - ffi
primStartPlatform

	^ self ffiCall: #(void moz2d_services_init_platform())