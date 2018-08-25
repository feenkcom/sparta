Class {
	#name : #MozInstallerStep,
	#superclass : #Object,
	#instVars : [
		'beacon',
		'isActive',
		'isDone',
		'title'
	],
	#category : 'Sparta-Moz2D-Installer-Actions'
}

{ #category : #accessing }
MozInstallerStep >> announce: anAnnouncement [
	self beacon announce: anAnnouncement
]

{ #category : #accessing }
MozInstallerStep >> beacon [
	^ beacon
]

{ #category : #initialization }
MozInstallerStep >> defaultTitle [
	^ 'Step'
]

{ #category : #running }
MozInstallerStep >> doActionIn: anInstaller [
	self subclassResponsibility
]

{ #category : #running }
MozInstallerStep >> handleError: anError in: anInstaller [

	anInstaller announce: (SpartaInstallerSwitchStepBrickAnnouncement new brick: (self newErrorBrickIn: anInstaller for: anError)).	
	anInstaller flush
]

{ #category : #initialization }
MozInstallerStep >> initialize [
	super initialize.
	
	isActive := false.
	isDone := false.

	beacon := Beacon new.

	title := self defaultTitle
]

{ #category : #accessing }
MozInstallerStep >> isActive [
	^ isActive
]

{ #category : #accessing }
MozInstallerStep >> isActive: anObject [
	isActive := anObject.
	
	isActive
		ifTrue: [ self announce: #activated ]
		ifFalse: [ self announce: #deactivated ]
]

{ #category : #accessing }
MozInstallerStep >> isDone [
	^ isDone
]

{ #category : #accessing }
MozInstallerStep >> isDone: anObject [
	isDone := anObject.
	
	isDone
		ifTrue: [ self announce: #done ]
		ifFalse: [ self announce: #ready ]
]

{ #category : #logging }
MozInstallerStep >> log: aString [
	self announce: (MozInstallerMessageSignal new message: aString).
	NonInteractiveTranscript stdout show: aString
]

{ #category : #logging }
MozInstallerStep >> logCr: aString [
	self announce: (MozInstallerMessageSignal new message: aString, String cr).
	
	
	
	NonInteractiveTranscript stdout show: aString; cr
]

{ #category : #'instance creation' }
MozInstallerStep >> newErrorBrickIn: anInstaller for: anError [
	"Create and return a new step brick"
	
	^ SpartaInstallerErrorBrick new
		hSpaceFill;
		vSpaceFill;
		error: anError
]

{ #category : #'instance creation' }
MozInstallerStep >> newStepBrickIn: anInstaller [
	"Create and return a new step brick"

	^ GLMBrick new
]

{ #category : #'instance creation' }
MozInstallerStep >> newTranscriptIn: anInstaller [
	| aTranscript textBrick aFont |
	
	aTranscript := ThreadSafeTranscript new.

	aFont := LogicalFont familyName: StandardFonts defaultFont familyName pointSize: 9. 

	textBrick := SpartaGLMRubPluggableTextBrick new
		getTextSelector: #contents;
		setTextSelector: #clear;
		withoutAdornment;
		margin: 10;
		yourself.

	textBrick rubric on: aTranscript.
	textBrick beForPlainText.
	
	self when: MozInstallerMessageSignal do: [ :anAnnoucement |
		aTranscript nextPutAll: anAnnoucement message.
		aTranscript endEntry.
		aTranscript stepGlobal.
		textBrick beForPlainText.
		textBrick textFont: aFont.
		anInstaller flush ].

	^ textBrick
]

{ #category : #running }
MozInstallerStep >> runIn: anInstaller [
	
	self isActive: true.
	anInstaller announce: (SpartaInstallerSwitchStepBrickAnnouncement new brick: (self newStepBrickIn: anInstaller)).
	
	anInstaller flush.
	
	self doActionIn: anInstaller.
	
	self isActive: false.
	self isDone: true.
	
	anInstaller flush
]

{ #category : #accessing }
MozInstallerStep >> title [
	^ title
]

{ #category : #accessing }
MozInstallerStep >> title: anObject [
	title := anObject.
	
	self announce: #titleChanged
]

{ #category : #announcing }
MozInstallerStep >> when: anAnnouncementClass do: aValuable [
	self beacon announcer when: anAnnouncementClass do: aValuable
]

{ #category : #announcing }
MozInstallerStep >> when: anAnnouncementClass send: aSelector to: anObject [
	self beacon announcer weak when: anAnnouncementClass send: aSelector to: anObject
]
