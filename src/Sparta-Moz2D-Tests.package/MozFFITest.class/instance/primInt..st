private - ffi
primInt: aNumber

	^ self ffiCall: #(int moz2d_test_ffi_int(int aNumber))