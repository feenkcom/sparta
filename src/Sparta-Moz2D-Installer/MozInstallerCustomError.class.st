Class {
	#name : #MozInstallerCustomError,
	#superclass : #MozInstallerError,
	#category : 'Sparta-Moz2D-Installer-Errors'
}

{ #category : #initialization }
MozInstallerCustomError >> defaultHelp [
	^ ''
]

{ #category : #initialization }
MozInstallerCustomError >> defaultMessage [
	^ ''
]

{ #category : #accessing }
MozInstallerCustomError >> help: aText [
	super help: String cr asText, aText, String cr
]

{ #category : #accessing }
MozInstallerCustomError >> message: aText [
	messageText := aText
]
