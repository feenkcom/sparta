private - ffi
primShutdownServices

	^ self ffiCall: #(void moz2d_services_shutdown_services())