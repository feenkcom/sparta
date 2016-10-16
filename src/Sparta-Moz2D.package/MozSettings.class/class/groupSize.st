settings
groupSize
	^ self = MozSettings
		ifTrue: [ 15 ]
		ifFalse: [ 15 ]