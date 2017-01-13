private - ffi
primInt64: aNumber

	^ self ffiCall: #(int64 moz2d_test_ffi_fixed_int64_t(int64 aNumber))