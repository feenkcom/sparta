api
install
	|pluginPath|
	
	"Library already exists and running, no need to install it again"
	MozServices isRunning
		ifTrue: [ ^ self ].

	self downloadFilename exists
		ifFalse: [ Error signal: 'Library is not downloaded!' ].
	
	pluginPath := self libraryInstallationPath / self libraryName.

	self ensureNotExist: pluginPath.
	self assert: [ pluginPath isWritable ] description: [ 'Library destination must be writable' ].
	NonInteractiveTranscript stdout show: 'Installing library to ', pluginPath asString; cr.
	
	self downloadFilename moveTo: pluginPath.
	
	"we must not start services if they are already running"
	self assert: [ MozServices isRunning not ] description: [ 'Services must not be running' ].
	
	NonInteractiveTranscript stdout show: 'Launching Moz2D services...'; cr.
	MozServices start.
	NonInteractiveTranscript stdout show: 'Sparta-Moz2D succesfully installed!'; cr.