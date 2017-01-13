private - ffi
primInt16: aNumber

	^ self ffiCall: #(int16 moz2d_test_ffi_fixed_int16_t(int16 aNumber))