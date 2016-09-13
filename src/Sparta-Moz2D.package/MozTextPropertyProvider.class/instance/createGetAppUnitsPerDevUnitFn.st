private - callbacks
createGetAppUnitsPerDevUnitFn

	^ FFICallback 
		signature: #(uint32 (void))
		block: [
			[ self appUnitsPerDevUnit ] 
			on: Error do: [ :e | 0 "Error happened" ] ]