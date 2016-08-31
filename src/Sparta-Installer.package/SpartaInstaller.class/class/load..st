actions
load: aGroup
	|installer|
	self
		assert: [ aGroup isSymbol ]
		description: [ 'Group must be a symbol!' ].
	
	installer := self new.
	self perform: aGroup asMutator with: installer.
	installer postLoadActions.