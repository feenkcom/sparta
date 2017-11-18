drawing-polygons
drawPolygon: vertices color: aColor borderWidth: bw borderColor: bc
	| aPath |
	
	vertices
		ifEmpty: [ ^ self ].
	
	(aColor isTransparent and: [ bw isZero or: [ bc isTransparent ] ])
		ifTrue: [ ^ self ].
	
	aPath := self canvas shape polygon: vertices.
	
	aColor isTransparent
		ifFalse: [ 
			self canvas fill
				path: aPath;
				paint: aColor;
				draw ].

	(bw isZero or: [ bc isTransparent ])
		ifFalse: [ 
			self canvas stroke
				path: aPath;
				paint: bc;
				width: bw;
				draw ]