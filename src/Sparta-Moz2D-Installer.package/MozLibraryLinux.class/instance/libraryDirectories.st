library
libraryDirectories
	^ { 
		Smalltalk vm fullPath asFileReference parent / 'bin'.
		Smalltalk vm fullPath asFileReference parent.
		Smalltalk image imageDirectory asFileReference
	}