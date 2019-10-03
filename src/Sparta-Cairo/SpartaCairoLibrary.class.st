Class {
	#name : #SpartaCairoLibrary,
	#superclass : #FFILibrary,
	#category : #'Sparta-Cairo-Library'
}

{ #category : #private }
SpartaCairoLibrary >> findUnixModule: aLibraryName in: directories [
	"On different flavors of linux the path to library may differ
	depending on OS distro or whether system is 32 or 64 bit.
	Packages such as snapcraft can also change the path.
	Look in the supplied locations, or LD_LIBRARY_PATH."

	(directories,
			((OSEnvironment current at: 'LD_LIBRARY_PATH' ifAbsent: [ '' ]) substrings: ':'))
		do: [ :path | 
			| libraryPath |
			libraryPath := path asFileReference / aLibraryName.
			libraryPath exists
				ifTrue: [ ^ libraryPath fullName ] ].
	self error: ('Cannot locate {0}. Please check if it installed on your system' 
			format: aLibraryName)
]

{ #category : #'accessing platform' }
SpartaCairoLibrary >> macModuleName [
	^ 'libcairo.2.dylib'
]

{ #category : #'accessing platform' }
SpartaCairoLibrary >> unix32ModuleName [
	"On different flavors of linux the path to library may differ
	depending on OS distro or whether system is 32 or 64 bit."

	^self findUnixModule: 'libcairo.so.2' in:
		#(	'/usr/lib/i386-linux-gnu/'
			'/usr/lib32/'
			'/usr/lib/').

]

{ #category : #'accessing platform' }
SpartaCairoLibrary >> unix64ModuleName [
	"On different flavors of linux the path to library may differ
	depending on OS distro or whether system is 32 or 64 bit."

	^self findUnixModule: 'libcairo.so.2' in:
		#(	'/usr/lib/x86_64-linux-gnu/'
			'/lib/x86_64-linux-gnu/'
			'/usr/lib/').

]

{ #category : #'accessing platform' }
SpartaCairoLibrary >> unixModuleName [
	"On different flavors of linux the path to library may differ
	depending on OS distro or whether system is 32 or 64 bit."
	
	^self unix32ModuleName
]

{ #category : #'accessing platform' }
SpartaCairoLibrary >> win32ModuleName [ 
	^ 'libcairo-2.dll'
]
