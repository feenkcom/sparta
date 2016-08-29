api
download
	UIManager default informUserDuring: [ :bar |
		self ensureNotExist: self downloadFilename.
		bar label: 'Requesting Moz2D Library file...'.
		NonInteractiveTranscript stdout cr; show: 'Downloading ', self url, ' to ', self downloadFilename asString, ' ...';cr.
		[ ZnClient new
			"A horrible hack... using wget works, with ZnClient 403 Forbidden"
			url: 'http://syrel.ch/download.php?url=', self url;
			signalProgress: true;
			downloadTo: self downloadFilename ]
		on: HTTPProgress 
		do: [ :progress |
			progress isEmpty ifFalse: [ 
				bar current: progress percentage.
				progress total ifNotNil: [ :aTotalNumber | | humanReadable |
					humanReadable := self printHumanReadableSize: aTotalNumber.
					humanReadable := 'Downloading ', progress percentage asInteger asString, '% of ', humanReadable, ' of Moz2D Library... '.
					bar label: humanReadable ] ].
			progress resume ] ]