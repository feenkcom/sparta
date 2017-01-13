instance creation
callbackIntptr
	^ FFICallback 
		signature: #(long (long))
		block: [ :value | value ]