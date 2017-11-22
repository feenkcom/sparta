running
doActionIn: anInstaller
	| destinationFolder downloadFilename |
	
	destinationFolder := anInstaller destinationFolder.

	destinationFolder exists
		ifTrue: [ destinationFolder deleteAll ].
	
	destinationFolder exists
		ifTrue: [ ^ (MozInstallerErrorLocalDirectoryExists new directory: destinationFolder) signal ].
	
	destinationFolder createDirectory.	
	
	destinationFolder exists
		ifFalse: [ ^ (MozInstallerErrorCanNotCreateLocalDirectory new directory: destinationFolder) signal ].
	
	downloadFilename := destinationFolder / anInstaller downloadFileName.
	NonInteractiveTranscript stdout cr; show: 'Downloading ', anInstaller platform urlPath, ' to ', downloadFilename asString, ' ...'; cr.
	
	 [ [ ZnClient new
			"A horrible hack... using wget works, with ZnClient 403 Forbidden"
			url: 'http://dl.feenk.com/', anInstaller platform urlPath;
			signalProgress: true;
			timeout: 10 * 60; "timeout 10min"
			downloadTo: downloadFilename.
			NonInteractiveTranscript stdout cr. ]
		on: HTTPProgress 
		do: [ :progress |
			self announce: (MozInstallerDownloadProgress new progress: progress).
			progress resume ] ]
				on: NameLookupFailure
				do: [ :anError | MozInstallerCustomError new message: anError messageText capitalized; help: 'Double check your internet connection and try again'; signal ]