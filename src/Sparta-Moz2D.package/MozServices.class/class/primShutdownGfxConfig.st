private - ffi
primShutdownGfxConfig

	^ self ffiCall: #(void moz2d_services_shutdown_gfx_config())