Class {
	#name : #MozInstallerErrorCanNotCreateLocalDirectory,
	#superclass : #MozInstallerError,
	#instVars : [
		'directory'
	],
	#category : 'Sparta-Moz2D-Installer-Errors'
}

{ #category : #initialization }
MozInstallerErrorCanNotCreateLocalDirectory >> defaultHelp [
	^ '
We were unable to create a temporary directory for the download of Moz2D:
({1})
 - Make sure you launch Pharo with enough permissions for read and write in its working directory.
 - Check if there is enough free space on disk drive
'
]

{ #category : #initialization }
MozInstallerErrorCanNotCreateLocalDirectory >> defaultMessage [
	^ 'Unable to create a temporary directory'
]

{ #category : #accessing }
MozInstallerErrorCanNotCreateLocalDirectory >> directory [
	^ directory
]

{ #category : #accessing }
MozInstallerErrorCanNotCreateLocalDirectory >> directory: anObject [
	directory := anObject.
	
	self help: (self help format: { directory asString })
]
