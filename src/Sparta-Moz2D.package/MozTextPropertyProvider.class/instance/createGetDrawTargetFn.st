private - callbacks
createGetDrawTargetFn

	^ FFICallback 
		signature: #(void (ulonglong* aCanvasPtr))
		block: [ :aCanvasPtr |
			[
				aCanvasPtr unsignedLongAt: 1 put: self canvas handle.
				1 ]
			on: Error do: [ :e | 0 "Error happened" ] ]