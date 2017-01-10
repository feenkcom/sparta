private - ffi
valueNamed: aName in: anAddress
	^ self ffiCall: #(bool moz2d_test_DrawTargetType(String aName, int* anAddress))