private - ffi
primInt32Max

	^ self ffiCall: #(int32 moz2d_test_ffi_fixed_signed_max_int32_t())