services
start
	
	"self
		assert: [ self isRunning not ]
		description: [ 'Services must not be running' ]."
		
	MozLibrary uniqueInstance hasModule
		"If there is not Moz2D library installed we can not start services"
		ifFalse: [ 
			Warning signal: 'Moz2D library is not installed correctly.'.
			^ self ].

	"First of all we need to start services"
	[  self primStartServices.
		self primStartGfxConfig.
		OSPlatform current mozSettings export.
		self primStartPlatform ]
	"Image will crash anyway crash if something fails in library,
	so we just guard ourselves against image-side issues"
	on: Error do: [ isRunning := true ].
	isRunning := true