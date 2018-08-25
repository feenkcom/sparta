Class {
	#name : #MozInstaller,
	#superclass : #Object,
	#instVars : [
		'steps',
		'platform',
		'beacon',
		'destinationFolder',
		'installationFolder'
	],
	#category : 'Sparta-Moz2D-Installer-Actions'
}

{ #category : #adding }
MozInstaller >> addStep: anInstallerStep [

	steps add: anInstallerStep.
	self announce: #stepAdded
]

{ #category : #announce }
MozInstaller >> announce: anAnnouncement [
	self beacon announce: anAnnouncement
]

{ #category : #accessing }
MozInstaller >> beacon [
	^ beacon
]

{ #category : #accessing }
MozInstaller >> destinationFolder [
	^ destinationFolder
]

{ #category : #accessing }
MozInstaller >> destinationFolder: aFileReference [
	destinationFolder := aFileReference
]

{ #category : #accessing }
MozInstaller >> downloadFileName [
	^ 'MozPlugin_tmp'
]

{ #category : #announcing }
MozInstaller >> flush [
	"Flush all changes to UI"
	
	self announce: #flush
]

{ #category : #initialization }
MozInstaller >> initialize [
	super initialize.
	
	steps := OrderedCollection new.
	platform := Smalltalk platform mozLibraryInstaller new.
	beacon := Beacon new.
	
	self initializeSteps
]

{ #category : #initialization }
MozInstaller >> initializeSteps [

	self addStep: MozInstallerValidationStep new.
	self addStep: MozInstallerPrepareStep new.
	self addStep: MozInstallerDownloadStep new.
	self addStep: MozInstallerInstallStep new.
	self addStep: MozInstallerDoneStep new
]

{ #category : #accessing }
MozInstaller >> installationFolder [
	^ installationFolder
]

{ #category : #accessing }
MozInstaller >> installationFolder: aFileReference [
	installationFolder := aFileReference
]

{ #category : #accessing }
MozInstaller >> platform [
	^ platform
]

{ #category : #running }
MozInstaller >> run [
	self steps do: [ :aStep |
		 [ [ aStep runIn: self ]
			on: MozInstallerError
			do: [ :anError | ^ aStep handleError: anError in: self ] ]
				on: Error
				do: [ :anError | ^ aStep handleError: (MozInstallerUnhandledError new error: anError) in: self] ]
]

{ #category : #accessing }
MozInstaller >> steps [
	^ steps
]

{ #category : #announcing }
MozInstaller >> when: anAnnouncementClass send: aSelector to: anObject [
	self beacon announcer weak when: anAnnouncementClass send: aSelector to: anObject
]
