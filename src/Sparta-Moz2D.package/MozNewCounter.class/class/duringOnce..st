layer
duringOnce: aBlock
	| aResult |
	running ifTrue: [ ^ aBlock value ].
	running := true.
	self during: [ aResult := aBlock value ].
	^ aResult