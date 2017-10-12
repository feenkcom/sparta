services
stop
	
	MozLibrary uniqueInstance hasModule
		"If there is no Moz2D library installed we can not start services"
		ifFalse: [ 
			isRunning := false.
			^ self ].

	[	self primShutdownServices.
		self primShutdownPlatform.
		self primStartGfxConfig ]
	ensure: [ isRunning := false ]