logging
log: aString
	self announce: (MozInstallerMessageSignal new message: aString).
	NonInteractiveTranscript stdout show: aString