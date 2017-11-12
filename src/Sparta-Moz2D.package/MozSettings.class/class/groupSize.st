settings
groupSize
	^ self = MozSettings
		ifTrue: [ 16 ]
		ifFalse: [ 16 ]