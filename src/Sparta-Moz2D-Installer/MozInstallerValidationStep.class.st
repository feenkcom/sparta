Class {
	#name : #MozInstallerValidationStep,
	#superclass : #MozInstallerStep,
	#category : 'Sparta-Moz2D-Installer-Actions'
}

{ #category : #initialization }
MozInstallerValidationStep >> defaultTitle [
	^ 'Validation'
]

{ #category : #running }
MozInstallerValidationStep >> doActionIn: anInstaller [

	self logCr: 'Moz2D installed:'.
	MozServices isRunning
		ifTrue: [ self logCr: String tab, ' - yes' ]
		ifFalse: [ self logCr: String tab, ' - no' ].

	"Library already exists and running, no need to install it again"
	MozServices isRunning
		ifTrue: [ ^ MozInstallerErrorAlreadyInstalled signal ]
]

{ #category : #'instance creation' }
MozInstallerValidationStep >> newStepBrickIn: anInstaller [
	^ self newTranscriptIn: anInstaller
]
