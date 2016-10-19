converting
asSpartaPaintOn: aSpartaCanvas
	| gradient |
	gradient := aSpartaCanvas paint linearGradient.
	
	begin ifNotNil: [ gradient begin: begin ].
	end ifNotNil: [ gradient end: end ].
	stops ifNotNil: [ gradient stops: stops ].
	transformation ifNotNil: [ gradient transformation: transformation ].
	extend ifNotNil: [ gradient perform: extend ].

	^ gradient