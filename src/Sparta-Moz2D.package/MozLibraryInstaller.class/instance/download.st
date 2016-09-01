api
download
	UIManager default informUserDuring: [ :bar |
		|lastPercentage|
		lastPercentage := 0.
		self ensureNotExist: self downloadFilename.
		bar label: 'Requesting Moz2D Library file...'.
		NonInteractiveTranscript stdout cr; show: 'Downloading ', self url, ' to ', self downloadFilename asString, ' ...'; cr.
		[ ZnClient new
			"A horrible hack... using wget works, with ZnClient 403 Forbidden"
			url: 'http://syrel.ch/download.php?url=', self url;
			signalProgress: true;
			timeout: 10 * 60; "timeout 10min"
			downloadTo: self downloadFilename.
			NonInteractiveTranscript stdout cr. ]
		on: HTTPProgress 
		do: [ :progress |
			progress isEmpty ifFalse: [ 
				bar current: progress percentage.
				progress total ifNotNil: [ :aTotalNumber | | humanReadable percentage |
					humanReadable := self printHumanReadableSize: aTotalNumber.
					percentage := progress percentage asInteger.
					humanReadable := 'Downloading ', percentage asString, '% of ', humanReadable, ' of Moz2D Library... '.
					bar label: humanReadable ] ].
			progress resume ] ]