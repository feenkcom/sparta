private - callbacks
createGetSpacingFn

	^ FFICallback 
		signature: #( void ( uint32, uint32, double* retSpacing ) )
		block: [ :start :end :aHandle |
			[ | spacing array|
			array := FFIExternalArray fromHandle: aHandle type: 'double' size: end - start.
			spacing := self spacingIn: (start + 1 to: end).
			array atAll: (1 to: spacing size) putAll: spacing.
			1 ]
			on: Error do: [ :e | 0 "Error happened" ] ]