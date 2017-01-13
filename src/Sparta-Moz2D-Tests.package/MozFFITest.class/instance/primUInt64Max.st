private - ffi
primUInt64Max

	^ self ffiCall: #(uint64 moz2d_test_ffi_fixed_unsigned_max_uint64_t())