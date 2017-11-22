initialization
defaultHelp
	OSPlatform current isMacOS
		ifTrue: [ ^ self osxHelp ].
		
	^ '
We were not able to install Moz2D library in VM folder.
 - Make sure you launch Pharo with enough permissions for read and write in VM directory.
'