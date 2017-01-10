private - ffi
valueNamed: aName in: anAddress
	^ self ffiCall: #(bool moz2d_test_BackendType(String aName, int* anAddress))