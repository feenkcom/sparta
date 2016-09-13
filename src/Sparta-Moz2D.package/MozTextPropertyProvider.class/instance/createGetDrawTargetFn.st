private - callbacks
createGetDrawTargetFn

	^ FFICallback 
		signature: #(MozCanvas (void))
		block: [
			[ self canvas ]
			on: Error do: [ :e | 0 "Error happened" ] ]