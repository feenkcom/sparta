private - ffi
primShutdownPlatform

	^ self ffiCall: #(void moz2d_services_shutdown_platform())