streaming
putOn: aStream from: aStart to: anEnd
	aStart to: anEnd do: [ :index |
		aStream nextPut: (collection at: index) ]