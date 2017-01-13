private - ffi
primInt8: aNumber

	^ self ffiCall: #(int8 moz2d_test_ffi_fixed_int8_t(int8 aNumber))