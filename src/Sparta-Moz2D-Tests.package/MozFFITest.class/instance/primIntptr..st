private - ffi
primIntptr: aNumber

	^ self ffiCall: #(long moz2d_test_ffi_fixed_intptr_t(long aNumber))