Class {
	#name : #MozInstallerErrorAlreadyInstalled,
	#superclass : #MozInstallerError,
	#category : 'Sparta-Moz2D-Installer-Errors'
}

{ #category : #initialization }
MozInstallerErrorAlreadyInstalled >> defaultHelp [
	^ '
Moz2D library can not be upgraded once installed.
 - perform a fresh install in a new Pharo image
 - or manually delete libMoz2D from Virtual Machine folder and try again
'
]

{ #category : #initialization }
MozInstallerErrorAlreadyInstalled >> defaultMessage [
	^ 'Moz2D is already installed'
]
