private - ffi
primStartGfxConfig

	^ self ffiCall: #(void moz2d_services_init_gfx_config())