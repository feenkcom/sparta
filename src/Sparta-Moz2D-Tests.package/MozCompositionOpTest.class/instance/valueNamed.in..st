private - ffi
valueNamed: aName in: anAddress
	^ self ffiCall: #(bool moz2d_test_CompositionOp(String aName, int* anAddress))