private - ffi
primUInt16: aNumber

	^ self ffiCall: #(uint16 moz2d_test_ffi_fixed_uint16_t(uint16 aNumber))