instance creation
callbackInt16
	^ FFICallback 
		signature: #(int16 (int16))
		block: [ :value | value ]