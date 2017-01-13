instance creation
callbackInt32
	^ FFICallback 
		signature: #(int32 (int32))
		block: [ :value | value ]