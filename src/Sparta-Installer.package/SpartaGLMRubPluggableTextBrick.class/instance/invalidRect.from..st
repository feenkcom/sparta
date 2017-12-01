change reporting
invalidRect: aRectangle from: aMorph
	aMorph == self
		ifTrue: [ super invalidRect: aRectangle from: aMorph ]
		ifFalse: [ self changed ]