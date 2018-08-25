Class {
	#name : #MozInstallerMessageSignal,
	#superclass : #BeaconSignal,
	#instVars : [
		'message'
	],
	#category : 'Sparta-Moz2D-Installer-Announcements'
}

{ #category : #initialization }
MozInstallerMessageSignal >> initialize [
	super initialize
]

{ #category : #accessing }
MozInstallerMessageSignal >> message [
	^ message
]

{ #category : #accessing }
MozInstallerMessageSignal >> message: anObject [
	message := anObject
]
