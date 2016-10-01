accessing
do: aBlock
	|iterator|
	iterator := self iterator: 1 to: self size.
	[ iterator hasNext ]
		whileTrue: [ aBlock value: iterator next ]