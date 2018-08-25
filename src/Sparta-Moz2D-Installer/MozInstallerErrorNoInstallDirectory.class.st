Class {
	#name : #MozInstallerErrorNoInstallDirectory,
	#superclass : #MozInstallerError,
	#category : 'Sparta-Moz2D-Installer-Errors'
}

{ #category : #initialization }
MozInstallerErrorNoInstallDirectory >> defaultHelp [
	^ '
We were not able to find a suitable directory where we could install Moz2D library.
 - Make sure you launch Pharo with enough permissions for read and write in VM directory.
 - Check if there is enough free space on disk drive
'
]

{ #category : #initialization }
MozInstallerErrorNoInstallDirectory >> defaultMessage [
	^ 'Unable to find instalaltion directory'
]
