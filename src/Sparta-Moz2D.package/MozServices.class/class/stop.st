services
stop

	self
		assert: [ self isRunning ]
		description: [ 'Services must be running' ].

	MozLibrary uniqueInstance hasModule
		"If there is not Moz2D library installed we can not start services"
		ifFalse: [ 
			Notification signal: 'Moz2D library is not installed correctly.'.
			^ self ].

	[	self primShutdownServices.
		self primShutdownPlatform.
		self primStartGfxConfig ]
	ensure: [ isRunning := false ]