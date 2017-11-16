services
start

	MozLibrary uniqueInstance hasModule
		"If there is no Moz2D library installed we can not start services"
		ifFalse: [
			isRunning := false.
			^ self ].

	"First of all we need to start services"
	[  self primStartServices.
		self primStartGfxConfig.
		OSPlatform current mozSettings export.
		self primStartPlatform ]
	"Image will crash anyway crash if something fails in library,
	so we just guard ourselves against image-side issues"
	on: Error do: [ :e |
		MozCanvas primStderr: e messageText.
		isRunning := true ].
	isRunning := true