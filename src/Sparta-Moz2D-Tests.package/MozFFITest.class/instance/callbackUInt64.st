instance creation
callbackUInt64
	^ FFICallback 
		signature: #(uint64 (uint64))
		block: [ :value | value ]