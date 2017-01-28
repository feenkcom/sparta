accessing
formExtent
	^ (self begin ifNil: [ 0@0 ]) + (self end ifNil: [ 0@0 ])