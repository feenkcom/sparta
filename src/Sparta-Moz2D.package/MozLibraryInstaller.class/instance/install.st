api
install
	|pluginPath|

	self downloadFilename exists
		ifFalse: [ Error signal: 'Library is not downloaded!' ].
	
	pluginPath := self libraryInstallationPath / self libraryName.
	
	(Smalltalk vm listLoadedModules includes: self libraryName)
		ifTrue: [
			MozServices isRunning
				ifTrue: [ MozServices stop ].
			Smalltalk vm forgetModule: self libraryName ].

	self ensureNotExist: pluginPath.
	self assert: [ pluginPath isWritable ] description: [ 'Library destination must be writable' ].
	NonInteractiveTranscript stdout show: 'Installing library to ', pluginPath asString; cr.
	
	self downloadFilename moveTo: pluginPath.
	
	NonInteractiveTranscript stdout show: 'Launching Moz2D services...'; cr.
	MozServices start.
	NonInteractiveTranscript stdout show: 'Sparta-Moz2D succesfully installed!'; cr.