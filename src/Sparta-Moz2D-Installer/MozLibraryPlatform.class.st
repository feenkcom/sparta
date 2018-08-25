"
I am an abstract Moz2D library installer.

I download and install Moz2D library. I define a few abstract methods that should be implemented by my platform specific subclasses.

I use ZnClient to download plugin and than install it in a propriate location, near pharo vm.

Public API and Key Messages

- download - download plugin under temporary name
- install - move plugin to vm's directory and name it accordingly

   MozLibraryInstaller install
 
Internal Representation and Key Implementation Points.

	I add extention method #mozLibraryInstaller to OSPlatform
"
Class {
	#name : #MozLibraryPlatform,
	#superclass : #Object,
	#classInstVars : [
		'postLoaded'
	],
	#category : 'Sparta-Moz2D-Installer'
}

{ #category : #cleanup }
MozLibraryPlatform class >> cleanUp [
	super cleanUp.
	
	postLoaded := nil
]

{ #category : #installation }
MozLibraryPlatform class >> install [
	| installer ui |

	installer := MozInstaller new.
	ui := SpartaInstallerBrick new.
	ui installer: installer.
	ui extent: 650@300.
	ui openInBorderlessWindow.

	installer run
]

{ #category : #installation }
MozLibraryPlatform class >> mozPostLoad [
	<spartaPostLoad>
	
	"prevent from installing multiple times by metacello"
	(postLoaded isNil or: [ postLoaded not ])
		ifFalse: [ ^ self ].

	postLoaded := true.
	self install
]

{ #category : #api }
MozLibraryPlatform >> download [
	"Library already exists and running, no need to download it again"
	MozServices isRunning
		ifTrue: [ ^ self ].

	UIManager default informUserDuring: [ :bar |
		self ensureNotExist: self downloadFilename.
		bar label: 'Requesting Moz2D Library file...'.
		NonInteractiveTranscript stdout cr; show: 'Downloading ', self urlPath, ' to ', self downloadFilename asString, ' ...'; cr.
		[ ZnClient new
			"A horrible hack... using wget works, with ZnClient 403 Forbidden"
			url: 'https://dl.feenk.com/', self urlPath;
			signalProgress: true;
			timeout: 10 * 60; "timeout 10min"
			downloadTo: self downloadFilename.
			NonInteractiveTranscript stdout cr. ]
		on: HTTPProgress 
		do: [ :progress |
			progress isEmpty ifFalse: [ 
				bar current: progress percentage.
				progress total ifNotNil: [ :aTotalNumber | | humanReadable percentage |
					humanReadable := self printHumanReadableSize: aTotalNumber.
					percentage := progress percentage asInteger.
					humanReadable := 'Downloading ', percentage asString, '% of ', humanReadable, ' of Moz2D Library... '.
					bar label: humanReadable ] ].
			progress resume ] ]
]

{ #category : #configuration }
MozLibraryPlatform >> downloadDirectory [
	^ FileSystem disk workingDirectory
]

{ #category : #configuration }
MozLibraryPlatform >> downloadFilename [
	^ self downloadDirectory / 'MozPlugin_tmp'
]

{ #category : #private }
MozLibraryPlatform >> ensureNotExist: aFile [
	|file|
	file := aFile asFileReference.
	
	file exists ifTrue: [
		NonInteractiveTranscript stdout show: 'File exists: ', file asString; cr.
		file delete ].
	
	self
		assert: [ file exists not ]
		description: [ file asString , ' must not exist' ].
]

{ #category : #api }
MozLibraryPlatform >> install [
	| pluginPath |

	"Library already exists and running, no need to install it again"
	MozServices isRunning
		ifTrue: [ ^ self ].

	self downloadFilename exists
		ifFalse: [ Error signal: 'Library is not downloaded!' ].
	
	pluginPath := self libraryInstallationPath / self libraryName.

	self ensureNotExist: pluginPath.
	self assert: [ pluginPath isWritable ] description: [ 'Library destination must be writable' ].
	NonInteractiveTranscript stdout show: 'Installing library to ', pluginPath asString; cr.
	
	self downloadFilename moveTo: pluginPath.
	
	"we must not start services if they are already running"
	self assert: [ MozServices isRunning not ] description: [ 'Services must not be running' ].
	
	NonInteractiveTranscript stdout show: 'Launching Moz2D services...'; cr.
	MozServices start.
	MozServices isRunning
		ifTrue: [ NonInteractiveTranscript stdout show: 'Sparta-Moz2D succesfully installed!'; cr ]
		ifFalse: [ NonInteractiveTranscript stdout show: 'Sparta-Moz2D succesfully installed!'; cr ]
]

{ #category : #library }
MozLibraryPlatform >> libraryArch [
	|bits|
	bits := Smalltalk vm wordSize * 8.
	
	^ bits = 32
		ifTrue: [ 'i386' ]
		ifFalse: [ bits = 64
			ifTrue: [ 'x86_64' ]
			ifFalse: [ Error signal: 'Unknown platform ARCH: ', bits asString ] ]
]

{ #category : #library }
MozLibraryPlatform >> libraryDirectories [
	^ self subclassResponsibility
]

{ #category : #library }
MozLibraryPlatform >> libraryDirectory [
	^ self subclassResponsibility
]

{ #category : #private }
MozLibraryPlatform >> libraryInstallationPath [
	"Return a folder path where we should install a Moz2D library"
	<return: #FileReference>
	| path |
	
	"try to install in VM folder"
	path := self libraryDirectory.
	(path exists and: [ path isWritable ])
		"try to install in image folder"
		ifFalse: [ path := Smalltalk vm imagePath asFileReference parent ].
	(path exists and: [ path isWritable ])
		"try to install in working directory"
		ifFalse: [ path := FileSystem disk workingDirectory ].
	
	^ path
]

{ #category : #library }
MozLibraryPlatform >> libraryName [
	^ self subclassResponsibility
]

{ #category : #library }
MozLibraryPlatform >> libraryPlatform [
	^ self subclassResponsibility
]

{ #category : #library }
MozLibraryPlatform >> libraryVersion [
	^ 'development'
]

{ #category : #printing }
MozLibraryPlatform >> printHumanReadableSize: aTotalNumber [

	^ ((aTotalNumber / (1024 * 1024)) asFloat round: 1) printString, 'MB'
]

{ #category : #printing }
MozLibraryPlatform >> progressBar: aNumber [

	^ String streamContents: [ :stream |
		stream nextPutAll: '[0'.
		1 to: aNumber do: [ :i |
			i % 25 = 0
				ifTrue: [ stream nextPutAll: i asString ]
				ifFalse: [ 
					i % 2 = 0 ifTrue: [ stream nextPutAll: '=' ] ] ].
		aNumber + 1 to: 100 do: [ :i |
			i % 2 = 0 ifTrue: [ stream nextPutAll: ' ' ] ].
		stream nextPutAll: ']' ]
]

{ #category : #configuration }
MozLibraryPlatform >> urlPath [
	"Return a textual representation of a plugin path in a download provider, for example:
	Moz2D/osx/development/i386/libMoz2D.dylib"
	<return: #String>

	^ 'Moz2D/',
		self libraryPlatform, '/',
		self libraryVersion,'/',
		self libraryArch, '/',
		self libraryName
]
