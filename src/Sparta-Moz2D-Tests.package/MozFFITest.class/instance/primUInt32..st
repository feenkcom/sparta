private - ffi
primUInt32: aNumber

	^ self ffiCall: #(uint32 moz2d_test_ffi_fixed_uint32_t(uint32 aNumber))