instance creation
callbackInt
	^ FFICallback 
		signature: #(int (int))
		block: [ :value | value ]