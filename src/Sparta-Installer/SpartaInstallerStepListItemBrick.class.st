"
Represent an item in a steps list.

Can be finished, waiting, active
"
Class {
	#name : #SpartaInstallerStepListItemBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'label',
		'installerStep'
	],
	#category : 'Sparta-Installer-UI'
}

{ #category : #colors }
SpartaInstallerStepListItemBrick >> activeColor [
	^ Smalltalk ui theme lightBackgroundColor
]

{ #category : #area }
SpartaInstallerStepListItemBrick >> activeVertices [
	"rectangle with right arrow"
	| aHeight aTriangleCathetus aWidth |
	
	aHeight := self height.
	aTriangleCathetus := aHeight // 2.
	
	aWidth := self width.
	
	^ { 
		0@0.
		(aWidth - aTriangleCathetus) @ 0.
		(aWidth @ aTriangleCathetus).
		(aWidth - aTriangleCathetus) @ (aTriangleCathetus * 2).
		0@(aTriangleCathetus * 2).
	}
]

{ #category : #controlling }
SpartaInstallerStepListItemBrick >> beActive [
	self color: self activeColor.
	self changed
]

{ #category : #controlling }
SpartaInstallerStepListItemBrick >> beDone [
	label textColor: self doneTextColor.
	self changed
]

{ #category : #controlling }
SpartaInstallerStepListItemBrick >> beNotActive [
	self color: self inactiveColor.
	self changed
]

{ #category : #controlling }
SpartaInstallerStepListItemBrick >> beNotDone [
	label textColor: self readyTextColor.
	self changed
]

{ #category : #controlling }
SpartaInstallerStepListItemBrick >> beReady [
	label textColor: self readyTextColor
]

{ #category : #initialization }
SpartaInstallerStepListItemBrick >> defaultRenderer [
	^ SpartaGLMBrickVerticesRenderer new
]

{ #category : #colors }
SpartaInstallerStepListItemBrick >> doneTextColor [
	^ Smalltalk ui theme disabledColor
]

{ #category : #colors }
SpartaInstallerStepListItemBrick >> inactiveColor [
	^ Color transparent
]

{ #category : #area }
SpartaInstallerStepListItemBrick >> inactiveVertices [
	"rectangle with right arrow"
	| aHeight aTriangleCathetus aWidth |
	
	aHeight := self height.
	aTriangleCathetus := aHeight // 2.
	
	aWidth := self width.
	
	^ { 
		0@0.
		(aWidth - aTriangleCathetus) @ 0.
		(aWidth @ aTriangleCathetus).
		0@(aTriangleCathetus * 2).
	}
]

{ #category : #initialization }
SpartaInstallerStepListItemBrick >> initialize [
	super initialize.
	
	self hSpaceFill.
	self useHorizontalLinearLayout.
	self paddingRight: 40.
	self paddingLeft: 20.
	self paddingTop: 10.
	self paddingBottom: 10.
	self height: 40.
	
	label := self newLabelBrick.
	label vAlign: #center.
	
	self addBrickBack: label
]

{ #category : #accessing }
SpartaInstallerStepListItemBrick >> installerStep [
	^ installerStep
]

{ #category : #accessing }
SpartaInstallerStepListItemBrick >> installerStep: anInstallerStep [
	installerStep := anInstallerStep.
	
	installerStep when: #activated send: #beActive to: self.
	installerStep when: #deactivated send: #beNotActive to: self.
	installerStep when: #done send: #beDone to: self.
	installerStep when: #ready send: #beNotDone to: self.
	installerStep when: #titleChanged send: #titleChanged to: self.
	
	installerStep isActive
		ifTrue: [ self beActive ]
		ifFalse: [ self beNotActive ].
		
	installerStep isDone
		ifTrue: [ self beDone ]
		ifFalse: [ self beNotDone ].
		
	self titleChanged
]

{ #category : #accessing }
SpartaInstallerStepListItemBrick >> label [
	^ label
]

{ #category : #accessing }
SpartaInstallerStepListItemBrick >> label: anObject [
	label := anObject
]

{ #category : #'instance creation' }
SpartaInstallerStepListItemBrick >> newLabelBrick [
	^ GLMLabelBrick new
]

{ #category : #colors }
SpartaInstallerStepListItemBrick >> readyTextColor [
	^ Smalltalk ui theme textColor
]

{ #category : #accessing }
SpartaInstallerStepListItemBrick >> text: aString [

	label text: aString
]

{ #category : #'changes handling' }
SpartaInstallerStepListItemBrick >> titleChanged [
	label text: self installerStep title.
	self changed
]

{ #category : #area }
SpartaInstallerStepListItemBrick >> vertices [
	^ self installerStep isActive
		ifTrue: [ self activeVertices ]
		ifFalse: [ self inactiveVertices ]
]
