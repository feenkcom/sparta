private - ffi
primStartServices

	^ self ffiCall: #(void moz2d_services_init_services())