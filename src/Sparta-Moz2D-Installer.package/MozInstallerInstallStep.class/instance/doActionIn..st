running
doActionIn: anInstaller
	| pluginPath downloadFileName |

	downloadFileName := anInstaller destinationFolder / anInstaller downloadFileName.

	"Library already exists and running, no need to install it again"
	MozServices isRunning
		ifTrue: [
			
		].

	downloadFileName exists
		ifFalse: [ Error signal: 'Library is not downloaded!' ].
	
	pluginPath := anInstaller installationFolder / anInstaller platform libraryName.

	self ensureNotExist: pluginPath.
	self
		assert: [ pluginPath isWritable ]
		description: [ 'Library destination must be writable' ].

	NonInteractiveTranscript stdout show: 'Installing library to ', pluginPath asString; cr.
	
	downloadFileName moveTo: pluginPath.
	
	pluginPath exists
		ifFalse: [ Error signal: 'Library was moved!' ]