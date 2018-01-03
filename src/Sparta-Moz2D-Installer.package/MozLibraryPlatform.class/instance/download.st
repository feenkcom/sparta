api
download
	"Library already exists and running, no need to download it again"
	MozServices isRunning
		ifTrue: [ ^ self ].

	UIManager default informUserDuring: [ :bar |
		self ensureNotExist: self downloadFilename.
		bar label: 'Requesting Moz2D Library file...'.
		NonInteractiveTranscript stdout cr; show: 'Downloading ', self urlPath, ' to ', self downloadFilename asString, ' ...'; cr.
		[ ZnClient new
			"A horrible hack... using wget works, with ZnClient 403 Forbidden"
			url: 'https://dl.feenk.com/', self urlPath;
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