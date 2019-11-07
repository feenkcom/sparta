Class {
	#name : #SkiaLibrary,
	#superclass : #FFILibrary,
	#category : #'Sparta-Skia-Library'
}

{ #category : #installation }
SkiaLibrary class >> install [
	<script: 'self install'>
	| installer |

	installer := GtLibraryInstaller new.
	installer library: 'Skia'.
	installer version: 'development'.
	installer icon: (Form extent: 1@1 depth: 32).
	installer binary: 'libSkia'.
	installer url: 'https://dl.feenk.com/{library}/{platform}/{version}/{arch}/{binary}.{extension}'.
	installer works: [ SkiaLibrary uniqueInstance hasModule ].

	installer run
]

{ #category : #'accessing platform' }
SkiaLibrary >> detectLibrary: aFileName [
	^ ({ Smalltalk imageDirectory . Smalltalk vmDirectory . FileSystem workingDirectory }
		collect: [ :aPath | aPath asFileReference / aFileName ])
			detect: #exists
			ifFound: #fullName
			ifNone: [ aFileName ]
]

{ #category : #'accessing platform' }
SkiaLibrary >> hasModule [
	"Return if there is a loadable and working Skia library installed, false otherwise"
	<return: #Boolean>
	| aResult |

	aResult := nil.
	
	[ aResult := self primTest ]
		on: Error
		do: [ :e | aResult := false ].

	^ aResult ifNil: [ false ]
]

{ #category : #'accessing platform' }
SkiaLibrary >> macModuleName [
	^ self detectLibrary: 'libSkia.dylib'
]

{ #category : #'accessing platform' }
SkiaLibrary >> primTest [
	^ self ffiCall: #(bool skia_test())
]

{ #category : #'accessing platform' }
SkiaLibrary >> unixModuleName [
	^ self detectLibrary: 'libSkia.so'
]

{ #category : #'accessing platform' }
SkiaLibrary >> win32ModuleName [
	^ self detectLibrary: 'libSkia.dll'
]
