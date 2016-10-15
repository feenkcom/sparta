private - ffi
primShutdown

	^ self ffiCall: #(void moz2d_services_shutdown_services())