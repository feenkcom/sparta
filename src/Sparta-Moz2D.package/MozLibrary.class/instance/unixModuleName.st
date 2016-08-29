accessing platform
unixModuleName

	^ (({ Smalltalk vm fullPath asFileReference parent / 'bin'.
		Smalltalk vm fullPath asFileReference parent.
		Smalltalk image imageDirectory asFileReference }
	collect: [ :path | path / 'libMoz2D.so' ])
	detect: [ :path | path exists ]
	ifNone: [ Error signal: 'Cannot locate Moz2D library. Please check if it installed on your system' ]) fullName