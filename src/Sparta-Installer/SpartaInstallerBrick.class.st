"
Top most container of the whole installer
"
Class {
	#name : #SpartaInstallerBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'lastUpdate',
		'stepBrick',
		'installer'
	],
	#category : 'Sparta-Installer-UI'
}

{ #category : #opening }
SpartaInstallerBrick >> closeWindow [
	self window
		ifNil: [ self delete ]
		ifNotNil: [ :aWindow | aWindow close ]
]

{ #category : #initialization }
SpartaInstallerBrick >> initialize [
	super initialize.
	
	lastUpdate := 0.
	
	self hSpaceFill.
	self vSpaceFill.
	self useHorizontalLinearLayout.
	self color: Smalltalk ui theme backgroundColor.
	self padding: 4.
	self borderWidth: 4.
	self borderColor: Smalltalk ui theme borderColor
]

{ #category : #initialization }
SpartaInstallerBrick >> initializeBricks [
	| aLogoContainer aSpartaLabel aStepList aListContainer aSpartaLogo |
	self
		assert: [ installer isNotNil ]
		description: [ 'Program must not be nil' ].

	aSpartaLogo := GLMActionButtonBrick new.
	aSpartaLogo icon: (SpartaCanvas logo scaledToSize: 50@50).
	aSpartaLogo vShrinkWrap.

	aSpartaLabel := GLMLabelBrick new.
	aSpartaLabel text: 'Sparta / Moz2D'.
	aSpartaLabel vAlign: #center.
	aSpartaLabel fontSize: 15. 
	aSpartaLabel hSpaceFill.
	aSpartaLabel vShrinkWrap.

	aLogoContainer := GLMBrick new.
	aLogoContainer useHorizontalLinearLayout.
	aLogoContainer hSpaceFill.
	aLogoContainer vShrinkWrap.
	aLogoContainer padding: 5.

	aLogoContainer addAllBricks: { aSpartaLogo . aSpartaLabel }.

	aStepList := self newStepList.
	aStepList installer: self installer.
	aStepList hSpaceFill: 90.
	aStepList vSpaceFill.

	aListContainer := GLMBandBrick new.
	aListContainer width: 210.
	aListContainer vSpaceFill.
	aListContainer zIndex: 2.

	aListContainer addAllBricks: { aLogoContainer . aStepList }.

	stepBrick := self newStepBrick.
	stepBrick useHorizontalLinearLayout.
	stepBrick hSpaceFill.
	stepBrick vSpaceFill.
	stepBrick marginLeft: 0.
	stepBrick paddingLeft: 0.
	
	self addAllBricks: { aListContainer . stepBrick }
]

{ #category : #accessing }
SpartaInstallerBrick >> installer [
	^ installer
]

{ #category : #accessing }
SpartaInstallerBrick >> installer: anObject [
	installer := anObject.
	
	installer when: #flush send: #updateNow to: self.
	installer when: SpartaInstallerSwitchStepBrickAnnouncement send: #stepSwitched: to: self.
	installer when: SpartaInstallerCloseAnnouncement send: #closeWindow to: self.

	self removeAllBricks.
	self initializeBricks
]

{ #category : #'change reporting' }
SpartaInstallerBrick >> invalidRect: aRectangle from: aMorph [
	
	super invalidRect: aRectangle from: aMorph.
	
	self update
]

{ #category : #'instance creation' }
SpartaInstallerBrick >> newStepBrick [
	^ GLMBrick new
]

{ #category : #'instance creation' }
SpartaInstallerBrick >> newStepList [
	^ SpartaInstallerStepListBrick new
]

{ #category : #opening }
SpartaInstallerBrick >> openInBorderlessWindow [
	^ (self asBrickedMorph mozOpenInWindowAt: 0@0)
		makeBorderless;
		beWithoutGrips;
		removeLabelArea
]

{ #category : #accessing }
SpartaInstallerBrick >> stepBrick [
	^ stepBrick
]

{ #category : #updating }
SpartaInstallerBrick >> stepSwitched: anAnnouncement [
	self stepBrick removeAllBricks.
	self stepBrick addBrickBack: anAnnouncement brick
]

{ #category : #updating }
SpartaInstallerBrick >> update [
	| msRefreshRate isTimeForRefresh |

	msRefreshRate := 60 "roughly 16 times per second".
	isTimeForRefresh := Time millisecondClockValue - lastUpdate >= msRefreshRate.
	(self isInWorld and: [ isTimeForRefresh ])
		ifFalse: [ ^ self ].
	
	self updateNow
]

{ #category : #updating }
SpartaInstallerBrick >> updateNow [	
	"We may be blocking the UI thread, and thus have to draw the world ourselves when necessary"
	
	lastUpdate := Time millisecondClockValue.
	UIManager default uiProcess == Processor activeProcess
		ifTrue: [ self currentWorld doOneCycleNow ]
]
