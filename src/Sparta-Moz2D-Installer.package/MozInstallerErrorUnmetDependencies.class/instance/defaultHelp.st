initialization
defaultHelp
	OSPlatform current isWindows
		ifTrue: [ ^ self windowsHelp ].
		
	OSPlatform current isUnix
		ifTrue: [ ^ self linuxHelp ].
		
	^ ''