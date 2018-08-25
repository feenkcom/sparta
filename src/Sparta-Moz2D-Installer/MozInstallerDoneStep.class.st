Class {
	#name : #MozInstallerDoneStep,
	#superclass : #MozInstallerStep,
	#category : 'Sparta-Moz2D-Installer-Actions'
}

{ #category : #initialization }
MozInstallerDoneStep >> defaultTitle [
	^ 'Finish'
]

{ #category : #running }
MozInstallerDoneStep >> doActionIn: anInstaller [
	1 second wait.
	anInstaller announce: SpartaInstallerCloseAnnouncement new
]

{ #category : #'instance creation' }
MozInstallerDoneStep >> newStepBrickIn: anInstaller [
	^ GLMStringBrick new
		text: 'Done!';
		fontSize: 20;
		textColor: Color gray;
		hAlign: #center;
		vAlign: #center;
		hShrinkWrap;
		vSpaceFill;
		yourself
]
