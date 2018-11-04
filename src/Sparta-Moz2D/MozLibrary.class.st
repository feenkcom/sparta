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
	| installer ui |

	installer := GtLibraryInstaller new.
	installer library: 'Moz2D'.
	installer version: 'development'.
	installer icon: (SpartaCanvas logo scaledToSize: 50@50).
	installer binary: 'libMoz2D'.
	installer url: 'https://dl.feenk.com/{library}/{platform}/{version}/{arch}/{binary}.{extension}'.
	installer running: [ MozServices isRunning ].
	installer works: [ MozLibrary uniqueInstance hasModule ].
	installer postInstall: [ MozServices start ].

	ui := GtLibraryInstallerMorph new.
	ui installer: installer.
	ui extent: 650@300.
	ui openInBorderlessWindow.

	installer run
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
