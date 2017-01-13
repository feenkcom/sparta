instance creation
callbackInt8
	^ FFICallback 
		signature: #(int8 (int8))
		block: [ :value | value ]