instance creation
callbackLong
	^ FFICallback 
		signature: #(long (long))
		block: [ :value | value ]