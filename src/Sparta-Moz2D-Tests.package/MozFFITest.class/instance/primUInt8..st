private - ffi
primUInt8: aNumber

	^ self ffiCall: #(uint8 moz2d_test_ffi_fixed_uint8_t(uint8 aNumber))