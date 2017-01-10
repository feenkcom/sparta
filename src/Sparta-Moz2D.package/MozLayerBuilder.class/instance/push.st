layer
push

	self
		primPushLayer: (mask ifNotNil: #getHandle ifNil: [ ExternalAddress null ])
		opaque: isOpaque
		alpha: alpha
		copy: shouldCopy
		a11: transformation sx
		a12: transformation shy
		a21: transformation shx
		a22: transformation sy
		a31: transformation x
		a32: transformation y
		x: (area ifNotNil: #left ifNil: 0)
		y: (area ifNotNil: #top ifNil: 0)
		width: (area ifNotNil: #width ifNil: 0)
		height: (area ifNotNil: #height ifNil: 0)