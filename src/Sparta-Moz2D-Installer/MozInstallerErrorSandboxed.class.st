Class {
	#name : #MozInstallerErrorSandboxed,
	#superclass : #MozInstallerError,
	#category : 'Sparta-Moz2D-Installer-Errors'
}

{ #category : #initialization }
MozInstallerErrorSandboxed >> defaultHelp [
	OSPlatform current isMacOS
		ifTrue: [ ^ self osxHelp ].
		
	^ '
We were not able to install Moz2D library in VM folder.
 - Make sure you launch Pharo with enough permissions for read and write in VM directory.
'
]

{ #category : #initialization }
MozInstallerErrorSandboxed >> defaultMessage [
	^ 'Unable to install Moz2D in VM directory'
]

{ #category : #help }
MozInstallerErrorSandboxed >> osxHelp [

	^ '
According to Apple security policies, applications that are not installed in /Applications folder run in a sandbox that prevents installation of additional libraries.
 - ' asText, 'Please, move Pharo.app to /Applications folder' asText allBold, '
'
]
