Class {
	#name : #SkiaLibrary,
	#superclass : #FFILibrary,
	#category : #'Sparta-Skia-Library'
}

{ #category : #logger }
SkiaLibrary class >> initEnvLogger [
	self uniqueInstance initEnvLogger
]

{ #category : #logger }
SkiaLibrary class >> initIcu [
	self uniqueInstance initIcu
]

{ #category : #'class initialization' }
SkiaLibrary class >> initialize [
	SessionManager default registerUserClassNamed: self name
]

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

{ #category : #'class initialization' }
SkiaLibrary class >> startUp: isANewSession [
	isANewSession
		ifTrue: [
			self initEnvLogger.
			self initIcu ]
]

{ #category : #'api - library' }
SkiaLibrary >> detectLibrary: aFileName [
	"Pharo9 introduced a platform specific FFILibraryFinder which should be used instead of this custom implementation"

	^ ({ Smalltalk imageDirectory . Smalltalk vmDirectory . Smalltalk vmBinary parent / 'Plugins'. FileSystem workingDirectory }
		collect: [ :aPath | aPath asFileReference / aFileName ])
			detect: #exists
			ifFound: #fullName
			ifNone: [ aFileName ]
]

{ #category : #'api - library' }
SkiaLibrary >> hasModule [
	"Return if there is a loadable and working Skia library installed, false otherwise"
	<return: #Boolean>
	| aResult |

	aResult := nil.
	
	[ aResult := self primTest ]
		on: Error
		do: [ :e | 
		NonInteractiveTranscript stderr nextPutAll: e description; cr.
		aResult := false ].

	^ aResult ifNil: [ false ]
]

{ #category : #'api - startup' }
SkiaLibrary >> initEnvLogger [
	[ self primInitEnvLogger ]
		on: Error
		do: [ :e | NonInteractiveTranscript stdout nextPutAll: '[Skia] Could not init env logger'; cr ]
]

{ #category : #'api - startup' }
SkiaLibrary >> initIcu [
	[ self primIcuInit ]
		on: Error
		do: [ :e | NonInteractiveTranscript stdout nextPutAll: '[Skia] Could not init icu'; cr ]
]

{ #category : #'api - library' }
SkiaLibrary >> macLibraryName [
	^ self class environment
		at: #FFIMacLibraryFinder
		ifPresent: [ :aLibraryFinder | aLibraryFinder findLibrary: 'libSkia.dylib' ]
		ifAbsent: [ self detectLibrary: 'libSkia.dylib' ]
]

{ #category : #'private - ffi' }
SkiaLibrary >> primIcuInit [
	^ self ffiCall: #(void skia_icu_init())
]

{ #category : #'private - ffi' }
SkiaLibrary >> primInitEnvLogger [
	^ self ffiCall: #(void skia_init_env_logger())
]

{ #category : #'private - ffi' }
SkiaLibrary >> primTest [
	^ self ffiCall: #(bool skia_test())
]

{ #category : #'api - library' }
SkiaLibrary >> unix32LibraryName [
	^ self class environment
		at: #FFIUnix32LibraryFinder
		ifPresent: [ :aLibraryFinder | aLibraryFinder findLibrary: 'libSkia.so' ]
		ifAbsent: [ self detectLibrary: 'libSkia.so' ]
]

{ #category : #'api - library' }
SkiaLibrary >> unix64LibraryName [
	^ self class environment
		at: #FFIUnix64LibraryFinder
		ifPresent: [ :aLibraryFinder | aLibraryFinder findLibrary: 'libSkia.so' ]
		ifAbsent: [ self detectLibrary: 'libSkia.so' ]
]

{ #category : #'api - library' }
SkiaLibrary >> win32LibraryName [
	^ self class environment
		at: #FFIWindowsLibraryFinder
		ifPresent: [ :aLibraryFinder | aLibraryFinder findLibrary: 'libSkia.dll' ]
		ifAbsent: [ self detectLibrary: 'libSkia.dll' ]
]
