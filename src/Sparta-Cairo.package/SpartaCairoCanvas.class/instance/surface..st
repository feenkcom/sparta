accessing
surface: aSurface

	self
		assert: [ surface isNil ]
		description: [ 'Surface can only be assigned once' ].

	surface := aSurface