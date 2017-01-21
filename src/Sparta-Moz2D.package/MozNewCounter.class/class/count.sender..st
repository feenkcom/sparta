enumerating
count: aClass sender: aSender
	| beforeCount aSendersDictionary aMethod |
	count ifFalse: [ ^ self ].

	[ beforeCount := count.
	count := false.

	aMethod := (((aSender method -> aSender sender method) -> aSender sender sender method) -> (aSender sender sender sender ifNotNil: #method)) -> ((aSender sender sender sender ifNotNil: [ :aContext | aContext sender ifNotNil: #method ])).
	aSendersDictionary := dictionary at: aClass ifAbsentPut: [ 0 -> Dictionary new ].
	aSendersDictionary key: aSendersDictionary key + 1.
	aSendersDictionary value at: aMethod put: (aSendersDictionary value at: aMethod ifAbsent: 0) + 1 ]
		ensure: [ count := beforeCount ]