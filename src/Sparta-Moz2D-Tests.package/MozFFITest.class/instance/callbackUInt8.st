instance creation
callbackUInt8
	^ FFICallback 
		signature: #(uint8 (uint8))
		block: [ :value | value ]