instance creation
callbackInt64
	^ FFICallback 
		signature: #(int64 (int64))
		block: [ :value | value ]