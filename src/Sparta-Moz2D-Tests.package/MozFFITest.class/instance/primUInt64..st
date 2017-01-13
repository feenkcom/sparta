private - ffi
primUInt64: aNumber

	^ self ffiCall: #(uint64 moz2d_test_ffi_fixed_uint64_t(uint64 aNumber))