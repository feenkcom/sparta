instance creation
callbackUInt16
	^ FFICallback 
		signature: #(uint16 (uint16))
		block: [ :value | value ]