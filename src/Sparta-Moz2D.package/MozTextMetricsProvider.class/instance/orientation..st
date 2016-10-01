accessing - orientation
orientation: anOrientation
	orientation ifNotNil: [ :o | self clearFlag: o value ].
	orientation := anOrientation.
	self addFlag: orientation value