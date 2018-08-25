"
I am a visual list of installer steps
"
Class {
	#name : #SpartaInstallerStepListBrick,
	#superclass : #GLMBandBrick,
	#instVars : [
		'installerProgram'
	],
	#category : 'Sparta-Installer-UI'
}

{ #category : #accessing }
SpartaInstallerStepListBrick >> installer [
	^ installerProgram
]

{ #category : #accessing }
SpartaInstallerStepListBrick >> installer: anObject [
	installerProgram := anObject.
	
	installerProgram when: #stepAdded send: #stepAdded to: self.
	
	self addAllBricks: (installerProgram steps collect: [ :aStep |
		self newStepItem installerStep: aStep ])
]

{ #category : #'instance creation' }
SpartaInstallerStepListBrick >> newStepItem [
	^ SpartaInstallerStepListItemBrick new
]

{ #category : #adding }
SpartaInstallerStepListBrick >> stepAdded [

	self addBrickBack: (self newStepItem installerStep: self installer steps last)
]
