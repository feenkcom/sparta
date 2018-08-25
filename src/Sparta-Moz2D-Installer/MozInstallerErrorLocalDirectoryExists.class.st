Class {
	#name : #MozInstallerErrorLocalDirectoryExists,
	#superclass : #MozInstallerError,
	#instVars : [
		'directory'
	],
	#category : 'Sparta-Moz2D-Installer-Errors'
}

{ #category : #initialization }
MozInstallerErrorLocalDirectoryExists >> defaultHelp [
	^ '
We could not delete a temporary directory where Moz2D library should be downloaded.
Please, delete ({1}) and try again.
'
]

{ #category : #initialization }
MozInstallerErrorLocalDirectoryExists >> defaultMessage [
	^ 'Unable to delete temporary directory'
]

{ #category : #accessing }
MozInstallerErrorLocalDirectoryExists >> directory [
	^ directory
]

{ #category : #accessing }
MozInstallerErrorLocalDirectoryExists >> directory: anObject [
	directory := anObject.
	
	self help: (self help format: { directory asString })
]
