private - ffi
primLong: aNumber

	^ self ffiCall: #(long moz2d_test_ffi_long (long aNumber))