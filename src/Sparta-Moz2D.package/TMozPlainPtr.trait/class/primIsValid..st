private - ffi
primIsValid: anAddress

	^ self ffiCall: #(bool moz2d_plain_ptr_is_valid(void* anAddress))