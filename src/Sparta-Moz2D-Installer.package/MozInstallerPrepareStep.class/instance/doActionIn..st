running
doActionIn: anInstaller
	| downloadDirectory installDirectory |

	downloadDirectory := self detectDownloadDirectory.
	anInstaller destinationFolder: downloadDirectory.
	self logCr: 'Download directory: ', String cr, downloadDirectory pathString, String cr.
	
	installDirectory := self detectInstallDirectoryFor: anInstaller.
	anInstaller installationFolder: installDirectory.
	self logCr: 'Installation directory: ',  String cr, installDirectory pathString.
	
	1 seconds wait