streaming
putOn: aStream from: aStart to: anEnd
	aStart to: anEnd do: [ :index |
		aStream nextPut: (self at: index) ]