actions
load: aGroup

	self
		assert: [ aGroup ]
		description: [ 'Group must be a symbol!' ].

	self ensureIceberg.
	self perform: aGroup with: self new