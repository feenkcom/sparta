api
download
	UIManager default informUserDuring: [ :bar |
		bar label: 'Downloading Moz2D Library...'.
		[ ZnClient new
			url: self url;
			https;
			signalProgress: true;
			downloadTo: self downloadFilename ]
		on: HTTPProgress 
		do: [ :progress |
			progress isEmpty ifFalse: [ 
				bar current: progress percentage.
				progress total ifNotNil: [ :aTotalNumber | | humanReadable |
					humanReadable := self printHumanReadableSize: aTotalNumber.
					bar label: 'Downloading ', humanReadable, ' of Moz2D Library... ' ] ].
			progress resume ] 
	]