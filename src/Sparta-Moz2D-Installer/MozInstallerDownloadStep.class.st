Class {
	#name : #MozInstallerDownloadStep,
	#superclass : #MozInstallerStep,
	#category : 'Sparta-Moz2D-Installer-Actions'
}

{ #category : #initialization }
MozInstallerDownloadStep >> defaultTitle [
	^ 'Download'
]

{ #category : #running }
MozInstallerDownloadStep >> doActionIn: anInstaller [
	| destinationFolder downloadFilename |
	
	destinationFolder := anInstaller destinationFolder.

	destinationFolder exists
		ifTrue: [ destinationFolder deleteAll ].
	
	destinationFolder exists
		ifTrue: [ ^ (MozInstallerErrorLocalDirectoryExists new directory: destinationFolder) signal ].
	
	destinationFolder createDirectory.	
	
	destinationFolder exists
		ifFalse: [ ^ (MozInstallerErrorCanNotCreateLocalDirectory new directory: destinationFolder) signal ].
	
	downloadFilename := destinationFolder / anInstaller downloadFileName.
	NonInteractiveTranscript stdout cr; show: 'Downloading ', anInstaller platform urlPath, ' to ', downloadFilename asString, ' ...'; cr.
	
	 [ [ ZnClient new
			"A horrible hack... using wget works, with ZnClient 403 Forbidden"
			url: 'https://dl.feenk.com/', anInstaller platform urlPath;
			signalProgress: true;
			timeout: 10 * 60; "timeout 10min"
			downloadTo: downloadFilename.
			NonInteractiveTranscript stdout cr. ]
		on: HTTPProgress 
		do: [ :progress |
			self announce: (MozInstallerDownloadProgress new progress: progress).
			progress resume ] ]
				on: NameLookupFailure
				do: [ :anError | MozInstallerCustomError new message: anError messageText capitalized; help: 'Double check your internet connection and try again'; signal ]
]

{ #category : #'instance creation' }
MozInstallerDownloadStep >> newStepBrickIn: anInstaller [
	| aContainer aLabel progressBrick |
	
	aContainer := GLMBandBrick new.
	aContainer margin: 20.
	aContainer hSpaceFill.
	aContainer vAlign: #center.
	
	aLabel := GLMLabelBrick new.
	aLabel text: 'Downloading Moz2D...'.
	aLabel hSpaceFill.
	aLabel marginBottom: 5.
	
	progressBrick := SpartaInstallerProgressBrick new.
	progressBrick hSpaceFill.
	progressBrick height: 4.
	progressBrick marginTop: 5.
	progressBrick color: Color veryVeryLightGray.
	progressBrick progressColor: Color lightGray.
	
	self when: MozInstallerDownloadProgress do: [ :anAnnouncement |
		| anHTTPProgress |
		anHTTPProgress := anAnnouncement progress.
		anHTTPProgress isEmpty
			ifFalse: [ progressBrick progress: anHTTPProgress fraction asFloat  ].
	].

	aContainer addAllBricks: { aLabel . progressBrick }.

	^ aContainer
]
