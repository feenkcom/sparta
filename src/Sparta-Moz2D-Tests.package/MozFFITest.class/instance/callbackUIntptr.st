instance creation
callbackUIntptr
	^ FFICallback 
		signature: #(ulong (ulong))
		block: [ :value | value ]