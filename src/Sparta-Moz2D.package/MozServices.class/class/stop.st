services
stop
	
	MozLibrary uniqueInstance hasModule
		"If there is no Moz2D library installed we can not start services"
		ifFalse: [ 
			isRunning := false.
			Warning signal: 'Moz2D library is not installed correctly.'.
			^ self ].

	[	self primShutdownServices.
		self primShutdownPlatform.
		self primStartGfxConfig ]
	ensure: [ isRunning := false ]