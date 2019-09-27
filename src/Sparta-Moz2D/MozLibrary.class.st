"
I'm an util to answer a name of Moz2D module library on different platforms. 
I just implement a double dispatch with the platform.
"
Class {
	#name : #MozLibrary,
	#superclass : #FFILibrary,
	#classInstVars : [
		'postLoaded'
	],
	#category : #'Sparta-Moz2D-Library'
}

{ #category : #installation }
MozLibrary class >> install [
	<script: 'self install'>
	| installer |

	"Windows require a few extra .dll first"
	self installWindowsExtras.

	installer := GtLibraryInstaller new.
	installer library: 'Moz2D'.
	installer version: 'development'.
	installer icon: (SpartaCanvas logo scaledToSize: 50@50).
	installer binary: 'libMoz2D'.
	installer url: 'https://dl.feenk.com/{library}/{platform}/{version}/{arch}/{binary}.{extension}'.
	installer running: [ MozServices isRunning ].
	installer works: [ MozLibrary uniqueInstance hasModule ].
	installer postInstall: [ MozServices start ].

	installer run
]

{ #category : #installation }
MozLibrary class >> installWindowsExtras [
	<script: 'self installWindowsExtras'>
	| msvcp140 vcruntime140 |
	
	OSPlatform current isWindows
		ifFalse: [ ^ self ].

	msvcp140 := GtLibraryInstaller new.
	msvcp140 library: 'Moz2D'.
	msvcp140 version: 'development'.
	msvcp140 icon: (SpartaCanvas logo scaledToSize: 50@50).
	msvcp140 binary: 'msvcp140'.
	msvcp140 url: 'https://dl.feenk.com/{library}/{platform}/{version}/{arch}/{binary}.{extension}'.
	msvcp140 run.
	
	vcruntime140 := GtLibraryInstaller new.
	vcruntime140 library: 'Moz2D'.
	vcruntime140 version: 'development'.
	vcruntime140 icon: (SpartaCanvas logo scaledToSize: 50@50).
	vcruntime140 binary: 'vcruntime140'.
	vcruntime140 url: 'https://dl.feenk.com/{library}/{platform}/{version}/{arch}/{binary}.{extension}'.
	vcruntime140 run.
]

{ #category : #'accessing platform' }
MozLibrary >> detectLibrary: aFileName [
	^ ({ Smalltalk imageDirectory . Smalltalk vmDirectory . FileSystem workingDirectory }
		collect: [ :aPath | aPath asFileReference / aFileName ])
			detect: #exists
			ifFound: #fullName
			ifNone: [ aFileName ]
]

{ #category : #testing }
MozLibrary >> hasModule [
	"Return if there is a loadable and working Moz2D library installed, false otherwise"
	<return: #Boolean>
	| aResult |

	aResult := nil.
	
	[ aResult := self primTest ]
		on: Error
		do: [ :e | aResult := false ].

	^ aResult ifNil: [ false ]
]

{ #category : #'accessing platform' }
MozLibrary >> macModuleName [
	^ self detectLibrary: 'libMoz2D.dylib'
]

{ #category : #'private - ffi' }
MozLibrary >> primTest [
	^ self ffiCall: #(bool moz2d_test())
]

{ #category : #'accessing platform' }
MozLibrary >> unixModuleName [
	^ self detectLibrary: 'libMoz2D.so'
]

{ #category : #'accessing platform' }
MozLibrary >> win32ModuleName [
	^ self detectLibrary: 'libMoz2D.dll'
]
