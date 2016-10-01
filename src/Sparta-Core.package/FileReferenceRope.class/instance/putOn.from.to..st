streaming
putOn: aStream from: aStart to: anEnd
	| readStream |
	readStream := self stream.
	readStream position: aStart - 1.
	
	aStart to: (anEnd min: 100) do: [ :index |
		aStream nextPut: (readStream next) ]