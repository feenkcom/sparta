Class {
	#name : #MozInstallerPrepareStep,
	#superclass : #MozInstallerStep,
	#category : 'Sparta-Moz2D-Installer-Actions'
}

{ #category : #initialization }
MozInstallerPrepareStep >> defaultTitle [
	^ 'Preparation'
]

{ #category : #running }
MozInstallerPrepareStep >> detectDownloadDirectory [
	| downloadDirectory |

	downloadDirectory := self downloadDirectories
		detect: [ :each | each exists ]
		ifNone: [ ^ MozInstallerErrorNoLocalDirectory signal ].
		
	downloadDirectory := downloadDirectory / self temporaryDirectory.

	^ downloadDirectory
]

{ #category : #running }
MozInstallerPrepareStep >> detectInstallDirectoryFor: anInstaller [
	| installDirectory |

	installDirectory := anInstaller platform libraryDirectories
		detect: [ :each | each exists ]
		ifNone: [ ^ MozInstallerErrorNoInstallDirectory signal ].

	^ installDirectory
]

{ #category : #running }
MozInstallerPrepareStep >> doActionIn: anInstaller [
	| downloadDirectory installDirectory |

	downloadDirectory := self detectDownloadDirectory.
	anInstaller destinationFolder: downloadDirectory.
	self logCr: 'Download directory: ', String cr, downloadDirectory pathString, String cr.
	
	installDirectory := self detectInstallDirectoryFor: anInstaller.
	anInstaller installationFolder: installDirectory.
	self logCr: 'Installation directory: ',  String cr, installDirectory pathString.
	
	1 seconds wait
]

{ #category : #folders }
MozInstallerPrepareStep >> downloadDirectories [
	^ {
		SystemResolver userLocalDirectory.
		FileSystem disk workingDirectory
	}
]

{ #category : #'instance creation' }
MozInstallerPrepareStep >> newStepBrickIn: anInstaller [
	^ self newTranscriptIn: anInstaller
]

{ #category : #folders }
MozInstallerPrepareStep >> temporaryDirectory [
	^ 'sparta-cache'
]
