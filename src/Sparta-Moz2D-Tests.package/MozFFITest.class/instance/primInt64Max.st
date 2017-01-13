private - ffi
primInt64Max

	^ self ffiCall: #(int64 moz2d_test_ffi_fixed_signed_max_int64_t())