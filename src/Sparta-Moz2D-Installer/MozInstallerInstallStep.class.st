Class {
	#name : #MozInstallerInstallStep,
	#superclass : #MozInstallerStep,
	#category : 'Sparta-Moz2D-Installer-Actions'
}

{ #category : #initialization }
MozInstallerInstallStep >> defaultTitle [
	^ 'Install'
]

{ #category : #running }
MozInstallerInstallStep >> doActionIn: anInstaller [
	| pluginPath downloadFileName |
		
	downloadFileName := anInstaller destinationFolder / anInstaller downloadFileName.

	"Library already exists and running, no need to install it again"
	MozServices isRunning
		ifTrue: [ MozInstallerErrorAlreadyInstalled signal ].

	downloadFileName exists
		"Bug in installer"
		ifFalse: [ Error signal: 'Library is not downloaded' ].
	
	pluginPath := anInstaller installationFolder / anInstaller platform libraryName.

	self ensureNotExist: pluginPath.
	pluginPath isWritable
		ifFalse: [  Error signal: 'Library destination must be writable' ].

	NonInteractiveTranscript stdout show: 'Installing library to ', pluginPath asString; cr.
	
	 [ downloadFileName moveTo: pluginPath ]
		on: Error
		do: [ MozInstallerErrorSandboxed signal ].
	
	pluginPath exists
		ifFalse: [ Error signal: 'Failed to move library to VM directory' ].
	
	MozLibrary uniqueInstance hasModule
		ifFalse: [ MozInstallerErrorUnmetDependencies signal ].
	
	MozServices start
]

{ #category : #running }
MozInstallerInstallStep >> ensureNotExist: aFile [
	|file|
	file := aFile asFileReference.
	
	file exists ifTrue: [
		NonInteractiveTranscript stdout show: 'File exists: ', file asString; cr.
		file delete ].
	
	self
		assert: [ file exists not ]
		description: [ file asString , ' must not exist' ].
]

{ #category : #'instance creation' }
MozInstallerInstallStep >> newStepBrickIn: anInstaller [
	^ self newTranscriptIn: anInstaller
]
