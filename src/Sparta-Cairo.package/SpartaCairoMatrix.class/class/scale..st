instance creation
scale: aFactor
	
	^ self new
		initX: 0
		y: 0
		sx: (aFactor isPoint ifTrue: [ aFactor x ] ifFalse: [ aFactor ])
		sy: (aFactor isPoint ifTrue: [ aFactor y ] ifFalse: [ aFactor ])
		shx: 0
		shy: 0;
		yourself