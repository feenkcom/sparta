private - ffi
valueNamed: aName in: anAddress
	^ self ffiCall: #(bool moz2d_test_FilterType(String aName, int* anAddress))