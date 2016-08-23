help
apiHelp
	^ String streamContents: [ :stream |
		stream
			nextPutAll: self pathHelp;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: self clipHelp;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: self fillHelp;
			nextPut: Character cr;
			nextPut: Character cr;
			nextPutAll: self strokeHelp ]