printing
asString
	self isNull
		ifTrue: [ ^ '' ].

	^ self
		primToStringQuotes: false
		includeDefault: true