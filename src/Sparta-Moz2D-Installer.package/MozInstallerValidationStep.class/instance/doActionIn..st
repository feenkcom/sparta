running
doActionIn: anInstaller

	self logCr: 'Moz2D installed:'.
	MozServices isRunning
		ifTrue: [ self logCr: String tab, ' - yes' ]
		ifFalse: [ self logCr: String tab, ' - no' ].

	"Library already exists and running, no need to install it again"
	MozServices isRunning
		ifTrue: [ ^ MozInstallerErrorAlreadyInstalled signal ]