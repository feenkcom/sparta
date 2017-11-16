printing
progressBar: aNumber

	^ String streamContents: [ :stream |
		stream nextPutAll: '[0'.
		1 to: aNumber do: [ :i |
			i % 25 = 0
				ifTrue: [ stream nextPutAll: i asString ]
				ifFalse: [ 
					i % 2 = 0 ifTrue: [ stream nextPutAll: '=' ] ] ].
		aNumber + 1 to: 100 do: [ :i |
			i % 2 = 0 ifTrue: [ stream nextPutAll: ' ' ] ].
		stream nextPutAll: ']' ]