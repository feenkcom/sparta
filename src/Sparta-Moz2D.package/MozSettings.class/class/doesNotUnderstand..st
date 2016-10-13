private
doesNotUnderstand: aMessage
	aMessage arguments isEmpty
		ifTrue: [ ^ (self uniqueInstance at: aMessage selector ) value ].
		
	aMessage arguments size = 1
		ifTrue: [ ^ self uniqueInstance at: aMessage selector allButLast put: aMessage arguments first ].
	^ super doesNotUnderstand: aMessage