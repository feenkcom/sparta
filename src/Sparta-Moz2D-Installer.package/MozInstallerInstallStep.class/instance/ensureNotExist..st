running
ensureNotExist: aFile
	|file|
	file := aFile asFileReference.
	
	file exists ifTrue: [
		NonInteractiveTranscript stdout show: 'File exists: ', file asString; cr.
		file delete ].
	
	self
		assert: [ file exists not ]
		description: [ file asString , ' must not exist' ].