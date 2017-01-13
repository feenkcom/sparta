instance creation
callbackUInt32
	^ FFICallback 
		signature: #(uint32 (uint32))
		block: [ :value | value ]