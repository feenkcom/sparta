private - callbacks
createGetHyphensOptionFn

	^ FFICallback 
		signature: #(void (void* aPropertyCollector))
		block: [ :aPropertyCollector |
			[ | option |
			option := self hyphensOption value.
			self primSetHyphensOption: option collector: aPropertyCollector.
			1 ] 
			on: Error do: [ :e | e logCr. 0 "Error happened" ] ]