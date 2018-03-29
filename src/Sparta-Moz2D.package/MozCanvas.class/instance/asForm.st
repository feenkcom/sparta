converting
asForm
	| checker form |
	
	self isValid
		ifFalse: [ ^ Form extent: 50@50 depth: 32 ].
	
	checker := self class checker: self extent.
	checker fill
		paint: self;
		path: self bounds;
		draw.
	
	form := Form extent: checker extent depth: 32.
	form unhibernate.
	checker primAsForm: form bits.
	^ form