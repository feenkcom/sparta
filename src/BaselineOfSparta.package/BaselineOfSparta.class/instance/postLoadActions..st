doits
postLoadActions: aSpecLoader

	self
		assert: (Smalltalk hasClassNamed: #SpartaInstaller)
		description: [ 'At this point SpartaInstaller must exist.' ].

	(Smalltalk classNamed: #SpartaInstaller) load: aSpecLoader spec required second