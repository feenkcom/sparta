streaming
putOn: aStream from: aStart to: anEnd

	anEnd <= left size
		ifTrue: [ left putOn: aStream from: aStart to: anEnd ]
		ifFalse: [ (aStart > left size)
			ifTrue: [ right putOn: aStream from: aStart - left size + 1 to: anEnd - left size ]
			ifFalse: [ 
				left putOn: aStream from: aStart to: left size.
				right putOn: aStream from: 1 to: anEnd - left size ] ]