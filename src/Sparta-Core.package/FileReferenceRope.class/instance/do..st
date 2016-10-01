enumerating
do: aBlock
	| readStream |
	readStream := self stream.
	[ readStream hasNext ] whileTrue: [ 
		aBlock value: readStream next ]