Class {
	#name : #MozInstallerErrorNoLocalDirectory,
	#superclass : #MozInstallerError,
	#category : 'Sparta-Moz2D-Installer-Errors'
}

{ #category : #initialization }
MozInstallerErrorNoLocalDirectory >> defaultHelp [
	^ '
We were not able to find a suitable directory where we could download Moz2D library.
 - Make sure you launch Pharo with enough permissions for read and write in its working directory.
 - Check if there is enough free space on disk drive
'
]

{ #category : #initialization }
MozInstallerErrorNoLocalDirectory >> defaultMessage [
	^ 'Unable to find local directory for download'
]
