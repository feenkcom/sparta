private - callbacks
createGetHyphensOptionFn

	^ FFICallback 
		signature: #(void (int8* retOption))
		block: [ :anOption |
			[ |option|
			option := self hyphensOption value.
			anOption unsignedLongAt: 1 put: option.
			1 ] 
			on: Error do: [ :e | 0 "Error happened" ] ]