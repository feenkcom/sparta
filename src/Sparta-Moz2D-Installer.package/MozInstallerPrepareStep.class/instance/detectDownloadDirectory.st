running
detectDownloadDirectory
	| downloadDirectory |

	downloadDirectory := self downloadDirectories
		detect: [ :each | each exists ]
		ifNone: [ ^ MozInstallerErrorNoLocalDirectory signal ].
		
	downloadDirectory := downloadDirectory / self temporaryDirectory.

	^ downloadDirectory