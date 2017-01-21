private - ffi
primStderr: aString

	self ffiCall: #(void moz2d_print_stderr ( String aString ) )