"
A progress bar
"
Class {
	#name : #SpartaInstallerProgressBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'progressColor',
		'progress'
	],
	#category : 'Sparta-Installer-UI'
}

{ #category : #initialization }
SpartaInstallerProgressBrick >> initialize [
	super initialize.
	
	progress := 0.
	progressColor := Color gray
]

{ #category : #'morph-drawing' }
SpartaInstallerProgressBrick >> onDraw: aCanvas [
	| progressBounds |
	super onDraw: aCanvas.
	
	progressBounds := self brickBounds origin extent: ((self width * self progress) asInteger @ self height).
	aCanvas fillRectangle: progressBounds color: self progressColor.
]

{ #category : #accessing }
SpartaInstallerProgressBrick >> progress [
	^ progress
]

{ #category : #accessing }
SpartaInstallerProgressBrick >> progress: aProgress [
	progress := aProgress.
	self changed
]

{ #category : #accessing }
SpartaInstallerProgressBrick >> progressColor [
	^ progressColor
]

{ #category : #accessing }
SpartaInstallerProgressBrick >> progressColor: anObject [
	progressColor := anObject
]
