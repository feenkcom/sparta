private - callbacks
createGetHyphenationBreaksFn

	^ FFICallback 
		signature: #(void (uint32, uint32, bool* retBreaks))
		block: [ :start :end :aHandle|
			[ | breaks array |
			array := FFIExternalArray fromHandle: aHandle type: 'bool' size: end - start.
			breaks := self hyphenationBreaksWithin: (start + 1 to: end).
			array atAll: (1 to: breaks size) putAll: breaks.
			1 ]
			on: Error do: [ :e | 0 "Error happened" ] ]