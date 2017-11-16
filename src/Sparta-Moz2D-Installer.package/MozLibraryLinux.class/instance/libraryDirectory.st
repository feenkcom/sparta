library
libraryDirectory
	^ { 
		Smalltalk vm fullPath asFileReference parent / 'bin'.
		Smalltalk vm fullPath asFileReference parent.
		Smalltalk image imageDirectory asFileReference
	} detect: [ :path | path exists and: [ path isWritable ] ]
	  ifNone: [ Error signal: 'Could not find writable directory to install library!' ]