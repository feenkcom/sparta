private - callbacks
createGetHyphenWidthFn

	^ FFICallback 
		signature: #(float (void))
		block: [
			[ self hyphenWidth ]
			on: Error do: [ :e | 0 "Error happened" ] ]