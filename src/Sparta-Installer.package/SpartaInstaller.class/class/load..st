actions
load: aGroup

	self
		assert: [ aGroup isSymbol ]
		description: [ 'Group must be a symbol!' ].

	self ensureIceberg.
	self perform: aGroup asMutator with: self new