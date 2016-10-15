settings
groupSize
	^ self = MozSettings
		ifTrue: [ Float infinity ]
		ifFalse: [ 10 ]