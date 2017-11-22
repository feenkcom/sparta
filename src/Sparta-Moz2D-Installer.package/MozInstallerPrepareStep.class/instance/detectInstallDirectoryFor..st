running
detectInstallDirectoryFor: anInstaller
	| installDirectory |

	installDirectory := anInstaller platform libraryDirectories
		detect: [ :each | each exists ]
		ifNone: [ ^ MozInstallerErrorNoInstallDirectory signal ].

	^ installDirectory