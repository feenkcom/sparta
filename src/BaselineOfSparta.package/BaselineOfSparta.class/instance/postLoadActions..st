doits
postLoadActions: aSpecLoader
	|group|
	
	self
		assert: (Smalltalk hasClassNamed: #SpartaInstaller)
		description: [ 'At this point SpartaInstaller must exist.' ].

	group := (aSpecLoader spec required difference: aSpecLoader spec packages keys) asArray first asSymbol.
	(Smalltalk classNamed: #SpartaInstaller) load: group