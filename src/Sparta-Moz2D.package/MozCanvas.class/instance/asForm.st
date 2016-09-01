converting
asForm
	|checker|
	checker := self class checker: self extent.
	checker fill
		paint: self;
		path: self bounds;
		draw.
	
	^ Form extent: checker extent depth: 32 fromArray: checker pixels offset: 0@0