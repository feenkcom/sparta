library
libraryDirectory
	^ { 
		Smalltalk vm fullPath asFileReference parent / 'bin'.
		Smalltalk image imageDirectory asFileReference
	} detect: [ :path | path isWritable ]
	  ifNone: [ Error signal: 'Could not find writable directory to install library!' ]