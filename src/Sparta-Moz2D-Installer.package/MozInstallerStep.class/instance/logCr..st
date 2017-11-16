logging
logCr: aString
	self announce: (MozInstallerMessageSignal new message: aString, String cr).
	
	
	
	NonInteractiveTranscript stdout show: aString; cr